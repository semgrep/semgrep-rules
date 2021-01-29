const shell = require('shelljs');

function test1(userInput) {
    // ruleid:shelljs-exec-injection
    return shell.exec(userInput, {silent: true})
}

function test2(userInput) {
    const input = `ls ${userInput}`
    // ruleid:shelljs-exec-injection
    return shell.exec(input, {silent: true})
}

function okTest3(userInput) {
    // ok:shelljs-exec-injection
    const input = 'ls ./'
    return shell.exec(input, {silent: true})
}

function okTest4(userInput) {
    // ok:shelljs-exec-injection
    return shell.exec('ls ./', {silent: true})
}
