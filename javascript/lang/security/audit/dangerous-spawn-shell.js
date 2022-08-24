const {spawn, spawnSync} = require('child_process');
const cp = require('child_process');

function test1(userInput) {
    let name = "bash";
    // ruleid: dangerous-spawn-shell
    spawnSync(name, ["-c", userInput]);
}

function test2(userInput) {
    // ruleid: dangerous-spawn-shell
    cp.spawn('sh', [userInput]);
}

function testOk(userInput) {
    foobar(userInput);
    // ok: dangerous-spawn-shell
    spawn('ls', ['-la', '/tmp']);
}

