const express = require('express');

const app = express();

app.get('/test1', function (req, res) {
    const origin = req.query.origin;
    // ruleid: cors-misconfiguration
    res.writeHead(200, { 'Access-Control-Allow-Origin': origin });
});

app.get('/test2', function (req, res) {
    // ruleid: cors-misconfiguration
    res.set({
        'Content-Length': 123,
        'access-control-allow-origin': req.body.origin,
        'ETag': '12345'
    })
});

app.get('/test3', function (req, res) {
    let origin = req.query.origin
    // ruleid: cors-misconfiguration
    res.set('access-control-allow-origin', origin)
});

app.get('/okTest1', function (req, res) {
    foobar()
    // ok: cors-misconfiguration
    res.set('access-control-allow-origin', 'xyz.com')
});
