const express = require('express');
const router = express.Router()


router.get("/tstMe", (req, res) => {
    var r = /([a-z]+)+$/;
    // ruleid:regex_dos
    let match = r.test(req.params.id);
});


module.exports = router

var http = require("http");
var url = require("url");
http.createServer(function (request, response) {

    var myArray = /d(b+)d/g.exec('cdbbdbsbz');
    var emailExpression = /^([a-zA-Z0-9_\.\-])+\@/ + foo + /(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;


    // ruleid:regex_dos
    var parsedUrl = url.parse(request.url, true);
    console.timeEnd('benchmark');
    /^(([a-z])+.)+[A-Z]([a-z])+$/.test(parsedUrl.query);

    /^(([a-z])+.)+[A-Z]([a-z])+$/.test('a'.repeat(100));
    console.timeEnd('benchmark');
    let match = r.test(req.params.id);
    // ruleid:regex_dos
    /^(([a-z])+.)+[A-Z]([a-z])+$/.test(request.foo);
    console.timeEnd('benchmark');
    // ruleid:regex_dos
    var y = /^(([a-z])+.)+[A-Z]([a-z])+$/.test(request.foo['bar']);
    console.timeEnd('benchmark');
    console.time('benchmark');
    var x = /^(([a-z])+.)+[A-Z]([a-z])+$/.test('a'.repeat(100));
    console.timeEnd('benchmark');

    // ruleid:regex_dos
    var myArray = /d(b+)d/g.exec(request.foo.bar);
    response.end();


    // ruleid:regex_dos
    var re = /(?:\d{3}|\(\d{3}\))([-\/\.])\d{3}\1\d{4}/;
    var OK = re.exec(request.value);
    if (!OK) {
        console.error(request.value + ' isn\'t a phone number with area code!');
    } else {
        console.log('Thanks, your phone number is ' + OK[0]);
    }

}).listen(8888);
