var http = require('http'),
    fileSystem = require('fs'),
    path = require('path');


var express = require('express');
var app = express();
app.get('/', function (req, res) {
    var filePath = path.join(__dirname, '/' + req.query.load);
    var readStream = fileSystem.createReadStream(filePath);
    // ruleid: generic_path_traversal2
    fileSystem.readFile(req.query.foo);
    // ruleid: generic_path_traversal2
    console.log(fileSystem.readFileSync(req.query.nar, 'utf8'));
    // ruleid: generic_path_traversal2
    var foo = req.query.y;
    fileSystem.readFile(foo);
    //do not match
    fileSystem.readFile(foo + "bar");
    readStream.pipe(res);
});
app.listen(8888);

