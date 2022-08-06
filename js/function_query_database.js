let mysql = require('mysql');
const axios = require('axios');


module.exports = async function (context, req) {
    context.log('JavaScript HTTP trigger function processed a request.');

    var conn = mysql.createConnection({
        host:"serverrfid.mysql.database.azure.com", 
        user:"rfid1234", 
        password:"P4ssw0rd", 
        database:"rfid", 
        port:3306});
        }


    let res = axios(config).then(resp => {
        console.log(tag.value);
        var tag = tag.value;
        var sql = `SELECT ${tag.value} from localização`;
        console.log(sql);
    
        conn.query(sql);
    });
    
    
    conn.connect(function(err) {
        if (err) {
            return console.error('error: ' + err.message);
        }
    
        console.log('Connect to the MySQL server. ');
    });


    const name = (req.query.name || (req.body && req.body.name));
    const responseMessage = name
        ? "Hello, " + name + ". This HTTP triggered function executed successfully."
        : "Authentication completed. You can go back!";

    context.res = {
        // status: 200, /* Defaults to 200 */
        body: responseMessage
    };
}
