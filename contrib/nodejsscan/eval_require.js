const express = require('express')
const app = express()
const port = 3000

const hardcodedPath = 'lib/func.js'

function testController1(req, res) {
    try {
        // ruleid: eval_require
        require(req.query.controllerFullPath)(req, res);
    } catch (err) {
        this.log.error(err);
    }
    res.end('ok')
};
app.get('/test1', testController1)

let testController2 = function (req, res) {
    // ruleid: eval_require
    const func = require(req.body)
    return res.send(func())
}
app.get('/test2', testController2)

var testController3 = null;
testController3 = function (req, res) {
    // ruleid: eval_require
    const func = require(req.body)
    return res.send(func())
}
app.get('/test3', testController3)

    (function (req, res) {
        // ruleid: eval_require
        const func = require(req.body)
        return res.send(func())
    })(req, res)
