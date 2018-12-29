const express = require('express');
const cors = require('cors');
const con = require('./db');
const tweets = require('./tweets');
const login = require('./login');
const bodyParser = require('body-parser');

const PORT = process.env.PORT || 5000;

var app = express();

app.use(cors());

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
});

app.use('/tweets', tweets);
app.use('/login', login);

app.listen(PORT, () => {
    console.log('Server running');
});