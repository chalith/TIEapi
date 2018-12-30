const environment = {
    appPath : "http://localhost:4200",
    //appPath : "https://tieopinion-fe02d.firebaseapp.com",
    dbAuth : {
        host: "localhost",
        user: "root",
        password: "",
        database: "tweetinterests",
    },
    /*dbAuth : {
        host: "db4free.net",
        user: "tievaluation1",
        password: "tievaluation@123",
        database: "tievaluation1"
    },*/
    newDataPath : "./data/csv/new/",
    annoatedDataPath : "./data/csv/annoated/",
    loginTimeout: 140
};

module.exports = environment;
