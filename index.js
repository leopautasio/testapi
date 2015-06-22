/*jslint node: true */

var http     =  require('http');
var express  =  require('express');
var mysql    =  require('mysql');
var env      =  require('./env');

var app      =  express();
var users    =  [];

var ip       =  process.env.OPENSHIFT_NODEJS_IP || '127.0.0.1';
var port     =  process.env.OPENSHIFT_NODEJS_PORT || 8080;

//********* DATABASE *********//

// db config
var db = require('./database.json')[env.name];
var password = db.password ? db.password : null;
    
// create mysql connection
var conn = {
    host     :  db.host,
    user     :  db.user,
    password :  db.password
  };

//var connection =  mysql.createConnection(conn);

//connection.query("use " + db.database);

// obtain all users from db
var strQuery = "select * from user";

/*
connection.query(strQuery, function (err, rows) {
  "use strict";
  var r;
  
  if (err) {
    throw err;
  } else {
    connection.destroy();
        
    // create array of users using user_id as array id    
    for (r in rows) {
      if (rows.hasOwnProperty(r)) {
        users[rows[r].user_id] = rows[r];
      }
    }
  }
    
});
*/

////********* API *********//

// API: get a user by its user_id
app.get('/user/:user_id', function (req, res) {
  "use strict";
  if (users[req.params.user_id]) {
    res.status(200).send(users[req.params.user_id]);
  } else {
    res.status(404).send('user not found');
  }
});

// API: get all users
app.get('/users', function (req, res) {
  "use strict";
  res.status(200).send(users);
});


// API: unrecognised incoming requests
app.get('*', function (req, res) {
  "use strict";
  res.status(404).send('Unrecognised API call');
});

// API: handle errors
app.use(function (err, req, res, next) {
  "use strict";
  if (req.xhr) {
    res.status(500).send('Oops, Something went wrong!');
  } else {
    next(err);
  }
});


// start server
app.listen(port);
console.log('App Server running at port ' + port + ' in ' + env.name + ' @ ' + ip);

//server.listen(port, ip, function(){
//  console.log("Listening on " + ip + ", server_port " + port)
//});