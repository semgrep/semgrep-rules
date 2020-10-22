const vm = require('vm')

function test3(userInput) {
    const code = `
        var x = ${userInput};
    `
// ruleid: vm-runincontext-code-injection
    vm.runInContext(code)
}

function okTest3(userInput) {
    const code = `
        var x = 1;
    `
// ok: vm-runinthiscontext-code-injection
    vm.runInContext(code)
}
