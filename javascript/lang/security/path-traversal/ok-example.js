function okTest1() {
    // ok
    var path = require('path');
    function someFunc(entry) {
        var extractPath = path.join(opts.path, entry.path);
        if (extractPath.indexOf(opts.path) != 0) {
            return;
        }
        return extractFile(extractPath);
    }
    someFunc();
}

function okTest2() {
    // ok
    let path = require('path')
    let somePath = req.body.path;
    let anotherPath = path.join(opts.path, somePath);
    if (anotherPath.startsWith(opts.path)) {
        return true;
    }
    return false;
}