var mysql = require('mysql');


var conn = mysql.createConnection({
host:"serverrfid.mysql.database.azure.com", 
user:"teste", 
password:"P4ssw0rd", 
database:"rfid", 
port:3306});


conn.connect(function(err) {
    if (err) {
        return console.error('error: ' + err.message);
    }

    console.log('Connect to the MySQL server. ');
});