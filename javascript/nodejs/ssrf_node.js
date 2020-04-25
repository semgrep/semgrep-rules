var express = require('express');
var needle = require('needle');
var app = express();
var urllib = require('urllib');

app.get('/', function (req, res) {
    
     // ruleid: node_ssrf
    needle('get', req.vbody.foo).then(res => {
        console.log(res.body);
    })
        .catch(err => {
            console.error(err);
        });

     // ruleid: node_ssrf
    urllib.request(req.foo, function (err, data, res) {
        if (err) {
            throw err; // you need to handle error
        }
        console.log(res.statusCode);
        console.log(res.headers);
        // data is Buffer instance
        console.log(data.toString());
    });

});