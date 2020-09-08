const path = require('path')
const express = require('express')
const app = express()
const port = 3000

app.get('/test1', (req, res) => {
    // ruleid:join_resolve_path_traversal
    var extractPath = path.join(opts.path, req.query.path);
    extractFile(extractPath);
    res.send('Hello World!');
})

app.post('/test2', function test2(req, res) {
    // ruleid:join_resolve_path_traversal
    createFile({ filePath: path.resolve(opts.path, req.body) })
    res.send('Hello World!')
})

function testCtrl3(req, res) {
    // ruleid:join_resolve_path_traversal
    let somePath = req.body.path;
    const pth = path.join(opts.path, somePath);
    extractFile(pth);
    res.send('Hello World!');
}

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))