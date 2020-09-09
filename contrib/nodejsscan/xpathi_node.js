var xpath = require('xpath');
var express = require('express');

var app = express();

app.get('/xpath', function (req, res) {
    // ruleid:node_xpath_injection
    var expr = xpath.parse("//persons/user[name/text()='" + req.param("name") + "']/details/text()");
    // ruleid:node_xpath_injection
    expr = xpath.parse("//persons/user[name/text()='" + req.param.name + "']/details/text()");
    // ruleid:node_xpath_injection
    expr = xpath.parse("//persons/user[name/text()='" + req["name"] + "']/details/text()");
    // ruleid:node_xpath_injection
    var foo = req.param;
    expr = xpath.parse("//persons/user[name/text()='" + foo + "']/details/text()");
    //do not match
    expr = JSON.parse("{'foo':" + req.param + "}");
    res.redirect('/home')
});
