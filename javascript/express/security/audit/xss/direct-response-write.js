
const express = require('express')
const router = express.Router()
var xss = require("xss");



router.get('/greeting', (req, res) => {
    const { name } = req.query;
    // ruleid: direct-response-write
    res.send('<h1> Hello :' + name + "</h1>")
})

//template handle escaping
router.get('/greet-template', (req, res) => {
    name = req.query.name
    // ok: direct-response-write
    res.render('index', { user_name: name });
})

//template handle escaping
router.get('/greet-template', (req, res) => {
    a = req.query.name
    // ok: direct-response-write
    res.send('<h1> Hello :' + xss(a) + "</h1>")
})


module.exports = router


app.get('/', function (req, res) {
    var user = req.query.name;

    msg = "Hi " + user
    // ruleid: direct-response-write
    res.send('Response</br>' + msg);
});


var msg = '';
app.get('/3', function (req, res) {
    var user = req.query.name;

    msg = "Hi " + user
    // ruleid: direct-response-write
    res.send('Response</br>' + msg);
});

app.get('/2', function (req, res) {
    var user = { user: req.query.name };
    // ruleid: direct-response-write
    res.send('Response</br>' + user.name);
});


app.get('/4', function (req, res) {
    var user = req.query.name;
    var header = "<html>";
    var msg = 'Hi ' + user;
    var footer = "</html>";
    var output = header + msg + footer;
    // ruleid: direct-response-write
    res.send(output);
});

var express = require('express');
var app = express();
app.get('/', function (req, res) {
    var resp = req.query.name;
    // ruleid: direct-response-write
    res.send('Response</br>' + resp);
});
app.get('/3', function (req, res) {
    var resp = req.query.name;
    // ruleid: direct-response-write
    res.write('Response</br>' + resp);
});

app.get('/3', function (req, res) {
    var resp = req.foo;
    var x = 1;
    // ok: direct-response-write
    res.write('Response</br>' + resp);
});

app.get('/xss', function (req, res) {
    var html = "ASadad" + req.query.name + "Asdadads"
    // ruleid: direct-response-write
    res.write('Response</br>' + html);
});
app.get('/xss', function (req, res) {
    // ruleid: direct-response-write
    res.write('Response</br>' + req.query('doo'));
});
app.get('/xss', function (req, res) {
    // ok: direct-response-write
    res.set('Content-Type','text/plain')
    res.write('Response</br>' + req.query.name);
});

app.get('/noxss', function (req, res) {
    var resp = req.query.name;
    // ok: direct-response-write
    res.write('Response</br>');
});

app.get('/noxs2s', function (req, res) {
    var resp = req.query.name;
    // ruleid: direct-response-write
    res.write('Response</br>' + resp);
});

app.get('/xss', function (req, res) {
    var resp = req.query.name;
    var html = "ASadad" + resp + "Asdadads"
    // ruleid: direct-response-write
    res.write('Response</br>' + html);
});
app.listen(8000);
