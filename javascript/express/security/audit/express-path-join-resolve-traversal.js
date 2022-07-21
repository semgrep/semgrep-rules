const path = require('path')
const express = require('express')
const app = express()
const port = 3000

app.get('/test1', (req, res) => {
    // ruleid:express-path-join-resolve-traversal
    var extractPath = path.join(opts.path, req.query.path);
    extractFile(extractPath);
    res.send('Hello World!');
})

app.post('/test2', function test2(req, res) {
    // ruleid:express-path-join-resolve-traversal
    createFile({filePath: path.resolve(opts.path, req.body)})
    res.send('Hello World!')
})

function testCtrl3(req,res) {
    let somePath = req.body.path;
    // ruleid:express-path-join-resolve-traversal
    const pth = path.join(opts.path, somePath);
    extractFile(pth);
    res.send('Hello World!');
}

const func4 = function testCtrl4(req,res) {
    let somePath = req.body.path;
    // ruleid:express-path-join-resolve-traversal
    const pth = path.join(opts.path, somePath);
    extractFile(pth);
    res.send('Hello World!');
}

const func5 = function (req,res) {
    let somePath = req.body.path;
    // ruleid:express-path-join-resolve-traversal
    const pth = path.join(opts.path, somePath);
    extractFile(pth);
    res.send('Hello World!');
}

app.post('/test3', testCtrl3)

app.post('/test5', function (req,res) {
    let data = req.body.path;
    for (let i = 0; i < data.length; i++) {
        // ruleid:express-path-join-resolve-traversal
        var pth = path.join(opts.path, data[i]);
        doSmth(pth);
    }
})

app.post('/ok-test1', function okTest1(req,res) {
    let data = ['one', 'two', 'three'];
    for (let x of data) {
        // ok:express-path-join-resolve-traversal
        var pth = path.join(opts.path, x);
        doSmth(pth);
    }
})

app.post('/ok-test2', function okTest2() {
    function someFunc() {
        createFile({
            // ok:express-path-join-resolve-traversal
            filePath: path.join(__dirname, 'val')
        })
        return true
    }
    someFunc()
})

app.post('/ok-test3', function (req,res) {
    let somePath = req.body.path;
    somePath = somePath.replace(/^(\.\.(\/|\\|$))+/, '');
    // ok:express-path-join-resolve-traversal
    return path.join(opts.path, somePath);
})

app.post('/ok-test4', function (req,res) {
    let somePath = sanitizer(req.body.path);
    // ok:express-path-join-resolve-traversal
    return path.join(opts.path, somePath);
})

app.post('/ok-test5', function okTest5(req,res) {
    let somePath = req.body.path;
    // ok:express-path-join-resolve-traversal
    let result = path.join(opts.path, somePath);  
    if (result.indexOf(opts.path) === 0) {
        return path;
    }
    return null
})

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))
