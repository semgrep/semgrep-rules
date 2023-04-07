const express = require('express')
const app = express()
const port = 3000

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
    var html = "<h1> message"
    // ruleid: raw-html-format
    html = html.concat(req.query.message)
    html = html.concat("</h1>")
    res.send(html);
})

app.post('/ok-test', async (req, res) => {
    let { foobar } = req.query
    let sanitizedParam = sanitizeUrl(foobar)
    const url = `${baseUrl}/foo/bar?yo=123&param=${sanitizedParam}`
    // ok: raw-html-format
    return res.send(`<a href="${url}" />`)
})

app.get('/ok', async (req, res) => {
    // ok: raw-html-format
    res.send("message: " + req.query.message);
})

app.post('/ok2', async (req, res) => {
    // ok: raw-html-format
    res.send(`message: ${req.query.message}`);
})

app.post('/ok3', async (req, res) => {
    // ok: raw-html-format
    var data = "message: " + req.query.message;
    res.send(data);
})

app.post('/ok4', async (req, res) => {
    var data = "message: "
    // ok: raw-html-format
    data = data.concat(req.query.message)
    res.send(data);
})


app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))
