var express = require('express');
var app = express();
app.get('/', function (req, res) {
    // ruleid:express_xss
    var resp = req.query.name;
    res.send('Response</br>' + resp);
});
app.get('/3', function (req, res) {
    // ruleid:express_xss
    var resp = req.query.name;
    res.write('Response</br>' + resp);
});

app.get('/3', function (req, res) {
    // ruleid:express_xss
    var resp = req.foo;
    var x = 1;
    res.write('Response</br>' + resp);
});

app.get('/xss', function (req, res) {
    // ruleid:express_xss
    var html = "ASadad" + req.query.name + "Asdadads"
    res.write('Response</br>' + html);
});
app.get('/xss', function (req, res) {
    // ruleid:express_xss
    res.write('Response</br>' + req.query('doo'));
});
app.get('/xss', function (req, res) {
    // ruleid:express_xss
    res.write('Response</br>' + req.query.name);
});

app.get('/noxss', function (req, res) {
    var resp = req.query.name;
    res.write('Response</br>');
});

app.get('/noxs2s', function (req, res) {
    var resp = req.query.name;
    res.write('Response</br>' + foo);
});

app.get('/xss', function (req, res) {
    // ruleid:express_xss
    var resp = req.query.name;
    var html = "ASadad" + resp + "Asdadads"
    res.write('Response</br>' + html);
});
app.listen(8000);