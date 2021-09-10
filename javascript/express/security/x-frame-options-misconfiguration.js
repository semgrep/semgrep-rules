var express = require('express'),
    app = express();

app.get('/', function (req, res) {
    // ruleid: x-frame-options-misconfiguration
    res.set('X-Frame-Options', req.query.opts)
    res.send('ok')
})

app.get('/', function (req, res) {
    // ok: x-frame-options-misconfiguration
    res.set('X-Frame-Options', 'SAMEORIGIN')
    res.send('ok')
})
