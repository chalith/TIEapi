const mysql = require('mysql');
const environment = require('./environment');

const con = mysql.createConnection(environment.dbAuth);

module.exports = con;