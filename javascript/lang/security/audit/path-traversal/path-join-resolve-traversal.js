var path = require('path');

function test1() {
    // ruleid: path-join-resolve-traversal
    function someFunc(entry) {
        var extractPath = path.join(opts.path, entry.path);
        return extractFile(extractPath);
    }
    someFunc();
}

function test2() {
    // ruleid: path-join-resolve-traversal
    function someFunc(val) {
        createFile({
            filePath: path.resolve(opts.path, val)
        })
        return true
    }
    someFunc()
}

function test3() {
    // ruleid: path-join-resolve-traversal
    let somePath = req.body.path;
    return path.join(opts.path, somePath);
}

function okTest1() {
    // ok
    function someFunc() {
        createFile({
            filePath: pth.join(opts.path, 'val')
        })
        return true
    }
    someFunc()
}