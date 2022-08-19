import { join, resolve } from 'path';
import sanitizer from './util/sanitizer';

function test1() {
    function someFunc(entry) {
        // ruleid:path-join-resolve-traversal
        var extractPath = join(opts.path, entry.path);
        return extractFile(extractPath);
    }
    someFunc();
}

function test2() {
    function someFunc(val) {
        createFile({
            // ruleid:path-join-resolve-traversal
            filePath: resolve(opts.path, val)
        })
        return true
    }
    someFunc()
}

function test3(req,res) {
    let somePath = req.body.path;
    // ruleid:path-join-resolve-traversal
    return join(opts.path, somePath);
}

function test4(req,res) {
    let data = req.body.path;
    data.forEach((entry) => {
    // ruleid:path-join-resolve-traversal
        var pth = join(opts.path, entry);
        doSmth(pth);
    })
}


function test5(req,res) {
    let data = req.body.path;
    for (let i = 0; i < data.length; i++) {
        // ruleid:path-join-resolve-traversal
        var pth = join(opts.path, data[i]);
        doSmth(pth);
    }
}

function okTest1(req,res) {
    let data = ['one', 'two', 'three'];
    for (let x of data) {
        // ok:path-join-resolve-traversal
        var pth = join(opts.path, x);
        doSmth(pth);
    }
}

function okTest2() {
    function someFunc() {
        createFile({
            // ok:path-join-resolve-traversal
            filePath: join(__dirname, 'val')
        })
        return true
    }
    someFunc()
}

function okTest3(req,res) {
    let somePath = req.body.path;
    somePath = somePath.replace(/^(\.\.(\/|\\|$))+/, '');
    // ok:path-join-resolve-traversal
    return join(opts.path, somePath);
}

function okTest4(req,res) {
    let somePath = sanitizer(req.body.path);
    // ok:path-join-resolve-traversal
    return join(opts.path, somePath);
}

function okTest5(req,res) {
    let somePath = req.body.path;
    // ok:path-join-resolve-traversal
    let result = join(opts.path, somePath);  
    if (result.indexOf(opts.path) === 0) {
        return path;
    }
    return null
}
