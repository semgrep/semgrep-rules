const Sandbox = require('sandbox');

function test1(userInput, cb) {
    const s = new Sandbox();
    // ruleid: sandbox-code-injection
    s.run('lol('+userInput+')', cb);
}

function test2(userInput, cb) {
    const s = new Sandbox();
    var code = 'lol('+userInput+')'
    // ruleid: sandbox-code-injection
    s.run(code, cb);
}

function test3(userInput, cb) {
    const s = new Sandbox();
    // ruleid: sandbox-code-injection
    s.run(`lol(${userInput})`, cb);
}

function okTest1(cb) {
    const s = new Sandbox();
    // ok: sandbox-code-injection
    s.run('lol("hi")', cb);
}

function okTest2(cb) {
    const s = new Sandbox();
    var code = 'lol("hi")'
    // ok: sandbox-code-injection
    s.run(code, cb);
}

function okTest3(cb) {
    const s = new Sandbox();
    // ok: sandbox-code-injection
    s.run(`lol("hi")`, cb);
}
