const express = require('express');
const path = require('path');
const con = require('./db');
const router = express.Router();
const environment = require('./environment');
const csv = require('csvtojson');
const fs = require('fs');
const keyword_extractor = require('keyword-extractor');
const uniqid = require('uniqid');

router.get('/fromdb', function (req, res) {
    var sql = 'SELECT * FROM tweetopinion;'
    con.query(sql, function (err, result) {
        if (err) throw err;
        res.send({ body: result });
    });
});

router.get('/', function (req, res) {
    getFile(environment.newDataPath, function (err, filepath) {
        if (err){
            res.writeHead(400, {'Content-type':'text/html'});
            console.log(err);
            res.end(err);
        }
        else{
            csv().fromFile(filepath).then((jsonObj)=>{
                jsonObj.forEach(item => {
                    item['keywords'] = keyword_extractor.extract(item.text,{
                        language:"english",
                        remove_digits: true,
                        return_changed_case:true,
                        remove_duplicates: false

                   });
                });
                res.send({filepath: filepath, tweets: jsonObj});
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
        values.push("('"+tweets[i].id+"','"+tweets[i].text.replace("'","\\'")+"','"+JSON.stringify(tweets[i].sentiment)+"','"+insertId+"')")
    }
    if(insertId){
        var sql = 'DELETE FROM tweetopinion WHERE create_id = \''+insertId+'\';'
        con.query(sql, function (err, res1) {
            if (err){
                res.writeHead(400, {'Content-type':'text/html'});
                console.log(err);
                res.end(err);
            }
            else insertData(values, (err, res2)=>{
                if (err){
                    res.writeHead(400, {'Content-type':'text/html'});
                    console.log(err);
                    res.end(err);
                }
                else{
                    res.send({ create_id: insertId });
                }
            });
        });   
    }
    else{
        insertData(values, (err, res1)=>{
            if (err){
                res.writeHead(400, {'Content-type':'text/html'});
                console.log(err);
                res.end(err);
            }
            else{
                fs.rename(filepath, environment.annoatedDataPath + create_id + ".csv", function (err) {
                    if (err){
                        res.writeHead(400, {'Content-type':'text/html'});
                        console.log(err);
                        res.end(err);
                    }
                    else{
                        res.send({ create_id: insertId });
                    }
                });
            }
        });
    }
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
            callback(null, dir+list[0]);
        }
        else{
            callback(null, null);
        }
    });
}

function isCSV(ext){
    if ('.csv' == ext){
        return true;
    }
    return false;
}

module.exports = router;