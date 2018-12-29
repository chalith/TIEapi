const environment = {
    appPath : "http://localhost:4200",
    //appPath : "https://sixthgear-fe348.firebaseapp.com",
    dbAuth : {
        host: "localhost",
        user: "root",
        password: "",
        database: "tweetinterests",
    },
    /*dbAuth : {
        host: "db4free.net",
        user: "sixthgear",
        password: "sixthgear@123",
        database: "sixthgear"
    },*/
    newDataPath : "./data/csv/new/",
    annoatedDataPath : "./data/csv/annoated/",
    loginTimeout: 140
};

module.exports = environment;