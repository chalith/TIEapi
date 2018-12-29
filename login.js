const express = require('express');
const con = require('./db');
const jwt = require('jsonwebtoken');
const fs = require('fs');
const router = express.Router();
const environment = require('./environment');

const RSA_PRIVATE_KEY = fs.readFileSync('private.key');

router.get('/', function (req, res) {
    var tables = ' a.*';
    var joins = ' admin a';
    var distinct = ' ';
    var orderby = ' ';
    var where = ' 1';
    var wheredata = [];
    if((req.query.distinct != undefined) &&
        (req.query.distinct == "true")){
        distinct += ' DISTINCT';
    }
    if((req.query.orderby != undefined) &&
        (req.query.orderby == "true") &&
        (req.query.ordercolumn != undefined)){
        orderby += ' ORDER BY ' + req.query.ordercolumn;
    }
    if(req.query.email != undefined){
        where += ' AND a.email = ?';
        wheredata.push(req.query.email);
    }
    sql = 'SELECT' + distinct + tables + ' FROM' + joins + ' WHERE' + where + orderby;
    con.query(sql, wheredata, function (err, result) {
        if (err) throw err;
        var user = result[0];
        if(user && user.password == req.query.password){
            const jwtBearerToken = jwt.sign({}, RSA_PRIVATE_KEY, {
                algorithm: 'RS256',
                expiresIn: environment.loginTimeout,
                subject: user.email
            });
            res.status(200).json({
                idToken: jwtBearerToken, 
                expiresIn: environment.loginTimeout,
                user: {id: user.id, email: user.email, image: user.image}
            });
        }else{
            res.sendStatus(401);
        }
    });
});

module.exports = router;