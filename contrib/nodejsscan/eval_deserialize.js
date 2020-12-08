var express = require('express');
var cookieParser = require('cookie-parser');
var escape = require('escape-html');
var serialize = require('node-serialize');
const serialize2 = require('serialize-to-js')


var app = express();
app.use(cookieParser())

app.get('/', function (req, res) {
    if (req.cookies.profile) {
        var str = new Buffer(req.cookies.profile, 'base64').toString();
        // ruleid:node_deserialize
        var obj = serialize.unserialize(str);
        // ruleid:serializetojs_deserialize
        serialize2.deserialize(str);
        if (obj.username) {
            res.send("Hello " + escape(obj.username));
        }
    } else {
        res.cookie('profile', "eyJ1c2VybmFtZSI6ImFqaW4iLCJjb3VudHJ5IjoiaW5kaWEiLCJjaXR5IjoiYmFuZ2Fsb3JlIn0=", {
            maxAge: 900000,
            httpOnly: true
        });
    }
    res.send("Hello World");
});
app.listen(3000);
// ruleid:serializetojs_deserialize
require('serialize-to-js').deserialize(str);
