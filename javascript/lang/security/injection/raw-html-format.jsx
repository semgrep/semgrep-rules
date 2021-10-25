const express = require('express')
const app = express()
const port = 3000
const phantom = require('phantom');

app.get('/test', async (req, res) => {
    // ruleid: raw-html-format
    res.send("<h1>" + "message: " + req.query.message + "</h1>");
})

app.post('/test2', async (req, res) => {
    // ruleid: raw-html-format
    res.send(`<h1>message: ${req.query.message}</h1>`);
})

app.post('/test3', async (req, res) => {
    // ruleid: raw-html-format
    var html = "<h1>" + "message: " + req.query.message + "</h1>"
    res.send(html);
})

app.post('/test4', async (req, res) => {
    // ruleid: raw-html-format
    var html = "<h1> message"
    // ruleid: raw-html-format
    html = html.concat(req.query.message)
    html = html.concat("</h1>")
    res.send(html);
})


app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))
