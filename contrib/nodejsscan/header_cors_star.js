const express = require('express');

const app = express();

// ruleid:generic_cors
app.options('*', cors())
app.get('/', function (req, res) {

    res.set(ffff)
});

app.get('/', function (req, res) {
    var y = 1;
    var x = '*';
    //sgrep bug - https://github.com/returntocorp/sgrep/issues/512
    // ruleid:express_cors
    res.writeHead(200, { 'Access-Control-Allow-Origin': '*' });
    // ruleid:express_cors
    res.set('access-control-allow-origin', '*');
    //do not match - sgrep bug -rewrite-rule
    res.set('Access-Control-Allow-Origin', 'google.com');
    // ruleid:express_cors
    res.set('Access-Control-Allow-Origin', '*');
    // ruleid:express_cors
    res.set({
        'Content-Length': 123,
        'access-control-allow-origin': '*',
        'ETag': '12345'
    })
    // ruleid:express_cors
    res.writeHead(200, { 'Access-Control-Allow-Origin': '*' })

    // ruleid:express_cors
    res.set('access-control-allow-origin', x);

    // do not detect - sgrep bug
    res.set('access-control-allow-origin', 'xyz.com');
    //do not detect - sgrep bug
    res.set('access-control-allow-origin', null);

});
