const express = require('express');
const path = require('path');
const con = require('./db');
const router = express.Router();
const environment = require('./environment');
const csv = require('csvtojson');
const fs = require('fs');
const keyword_extractor = require('keyword-extractor');
const uniqid = require('uniqid');
const escape_quotes = require('escape-quotes');

router.get('/fromdb', function (req, res) {
    var sql = 'SELECT * FROM tweetopinion;'
    con.query(sql, function (err, result) {
        if (err) throw err;
        res.send({ body: result });
    });
});

router.get('/', function (req, res) {
    getFile(environment.newDataPath, function (err, filename) {
        var filepath = environment.newDataPath + filename;
        if (err) res.send({ err: err });
        else{
            csv().fromFile(filepath).then((jsonObj)=>{
                jsonObj.forEach(item => {
                    item['keywords'] = keyword_extractor.extract(item.sentiment_text,{
                        language:"english",
                        return_changed_case:true,
                        remove_duplicates: false

                    });
                });
                var sql = 'INSERT INTO file(file) VALUES (\''+filename+'\');'
                con.query(sql, function (err, res1) {
                    if (err) console.log(err);
                    fs.rename(filepath, environment.annoatedDataPath + filename, function (err) {
                        if (err) console.log(err);
                        res.send({filepath: environment.annoatedDataPath + filename, tweets: jsonObj});
                    });
                });
            });
        }
    });
});

router.post('/', function (req, res) {
    var filepath = req.body.filepath;
    var tweets = req.body.tweets;
    var insertId = req.body.insertId;
    if(!insertId){
        insertId = uniqid();
    }
    var values = [];
    for(var i=0; i<tweets.length; i++){
        values.push("('"+tweets[i].id+"','"+escape_quotes(tweets[i].text)+"','"+JSON.stringify(tweets[i].sentiment)+"','"+insertId+"')")
    }
    var sql = 'DELETE FROM tweetopinion WHERE create_id = \''+insertId+'\';'
    con.query(sql, function (err, res1) {
        if(err) console.log(err);
        insertData(values, (err, res2)=>{
            if (err) console.log(err);
            if(filepath){
                fs.rename(filepath, environment.annoatedDataPath + insertId + ".csv", function (err) {
                    if (err) console.log(err);
                    res.send({ create_id: insertId });
                });
            }
            else{
                res.send({ create_id: insertId });
            }
        });
    }); 
});

function insertData(values, callback){
    var sql = 'INSERT INTO tweetopinion(tweet_id, text, sentiment, create_id) VALUES '+values.join()+';'
    con.query(sql, function (err, res) {
        callback(err, res);
    });
}

function getFile(dir, callback){
    fs.readdir(dir, function (err, list) {
        if(list.length > 0 && isCSV(path.extname(list[0]))) {
            var file;
            var sql = 'SELECT DISTINCT file FROM file;'
            con.query(sql, function (err, result) {
                if (err) throw err;
                for(var i=0; i<list.length; i++){
                    if(!isExist(result, list[i])){
                        file = list[i];
                        break;
                    }
                }
                if(file){
                    callback(null, file);
                }
                else{
                    callback("Files dos not exist", null);
                }
            });
            
        }
    });
}

function isExist(result, file){
    for(var i=0; i<result.length; i++){
        if(file === result[i].file){
            return true;
        }
    }
    return false;
}

function isCSV(ext){
    if ('.csv' == ext){
        return true;
    }
    return false;
}

module.exports = router;