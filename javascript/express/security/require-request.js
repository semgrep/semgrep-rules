const express = require('express')
const app = express()
const port = 3000

const hardcodedPath = 'lib/func.js'

function testController1(req, res) {
    try {
// ruleid: require-request
        require(req.query.controllerFullPath)(req, res);
    } catch (err) {
        this.log.error(err);
    }
    res.end('ok')
};

app.get('/test1', testController1)

app.get('/test2', (req, res) => {
// ruleid: require-request
    const func = require(req.body)
    return res.send(func())
})

app.get('/ok-test', (req, res) => {
// ok
    const func = require(hardcodedPath)
    return res.send(func())
})

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))