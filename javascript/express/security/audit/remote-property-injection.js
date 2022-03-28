var express = require('express');

var app = express();
var myObj = {}

app.get('/test1', function(req, res) {
  var prop = req.query.userControlled
  // ruleid: remote-property-injection
  myObj[prop] = function() {}
  res.send('ok')
})

app.get('/test2', function(req, res) {
  // ruleid: remote-property-injection
  myObj[req.body] = foobar()
  res.send('ok')
})

app.get('/okTest', function(req, res) {
  var prop = "$" + req.query.userControlled
  // ok: remote-property-injection
  myObj[prop] = function() {}
  res.send('ok')
})
