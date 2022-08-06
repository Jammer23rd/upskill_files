let mysql = require('mysql');
const axios = require('axios');


module.exports = async function (context, req) {
    context.log('JavaScript HTTP trigger function processed a request.');

    var conn = mysql.createConnection({
        host:"mext.mysql.database.azure.com", 
        user:"", 
        password:"", 
        database:"", 
        port:3306});
    
       
    
    const config = {
        method: 'get',
        url: 'https://www.strava.com/api/v3/athlete',
        headers: { 'Authorization': 'Bearer <insert access token here> ' }
    }
    
    let res = axios(config).then(resp => {
        console.log(resp.data);
        console.log(resp.data.id);
        console.log(resp.data.firstname);
        console.log(resp.data.lastname);
        console.log(resp.data.sex);
        console.log(resp.data.country);
        console.log(resp.data.weight);
        var id = resp.data.id;
        var firstname = resp.data.firstname;
        var lastname = resp.data.lastname;
        var sex = resp.data.sex;
        var country = resp.data.country;
        var weight = resp.data.weight;
        var sql = `insert into user (user_idstrava, user_firstname, user_lastname, user_sex, user_country, user_weight) values ("${id}","${firstname}", "${lastname}", "${sex}", "${country}", "${weight}")`;
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
