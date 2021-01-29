var http = require('http'),
    fileSystem = require('fs'),
    path = require('path');

var config = require('../config');
var Promise = require('bluebird');
Promise.promisifyAll(fileSystem);

var express = require('express');
var app = express();
app.get('/', function (req, res) {
    // ruleid:generic_path_traversal
    var filePath = path.join(__dirname, '/' + req.query.load);
    var readStream = fileSystem.createReadStream(filePath);
    // ruleid:generic_path_traversal
    fileSystem.readFile(req.query.foo);
    // ruleid:generic_path_traversal
    console.log(fileSystem.readFileSync(req.query.nar, 'utf8'));
    // ruleid:generic_path_traversal
    var foo = req.query.y;
    fileSystem.readFile(foo);
    fileSystem.readFile(foo + "bar");
    readStream.pipe(res);
});

app.get('/foo', function (req, res) {
    // ruleid:generic_path_traversal
    var date = req.query.date;
    var fileName = config.dirName + '/' + date;
    var downloadFileName = 'log_' + fileName + '.txt';

    fs.readFileAsync(fileName)
        .then(function (data) {
            res.download(fileName, downloadFileName);
        })
})

app.listen(8888);
// do not match
fileSystem.readFile(ddd);
