/*jslint node: true */

var http     =  require('http');
var express  =  require('express');
var mysql    =  require('mysql');

var app      =  express();
var people   =  [];


//********* DATABASE *********//

// create mysql connection
var connection =  mysql.createConnection({
  host     :  "127.0.0.1",
  user     :  "root",
  password :  "root"
});

connection.query("use testapi");

// obtain all people from db
var strQuery = "select * from people";

connection.query(strQuery, function (err, rows) {
  "use strict";
  var r;
  
  if (err) {
    throw err;
  } else {
    connection.destroy();
        
    // create array of people using people_id as array id
    for (r in rows) {
      if (rows.hasOwnProperty(r)) {
        people[rows[r].person_id] = rows[r];
      }
    }
  }
    
});


////********* API *********//

// API: get a person by its person_id
app.get('/person/:id', function (req, res) {
  "use strict";
  if (people[req.params.id]) {
    res.status(200).send(people[req.params.id]);
  } else {
    res.status(404).send();
  }
});

// API: get all people
app.get('/people', function (req, res) {
  "use strict";
  res.status(200).send(people);
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
console.log('App Server running at port 3000');