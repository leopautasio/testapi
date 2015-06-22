/*jslint node: true */

var http     =  require('http');
var express  =  require('express');
var mysql    =  require('mysql');

var app      =  express();
var users    =  [];
var env      =  app.get('env') === 'development' ? 'dev' : app.get('env');


//********* DATABASE *********//

// db config
//var env = "dev";
var db = require('./database.json')[env];
var password = db.password ? db.password : null;
    
// create mysql connection
var conn = {
    host     :  db.host,
    user     :  db.user,
    password :  db.password
  };

var connection =  mysql.createConnection(conn);

connection.query("use " + db.database);

// obtain all users from db
var strQuery = "select * from user";

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
app.listen(3000);
console.log('App Server running at port 3000 in ' + env);