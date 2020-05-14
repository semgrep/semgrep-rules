var http = require('http'),
    fileSystem = require('fs'),
    path = require('path');


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
app.listen(8888);
// do not match
fileSystem.readFile(ddd);
