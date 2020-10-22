const vm = require('vm')


function test3(userInput) {
    const code = `
        var x = ${userInput};
    `
// ruleid: vm-runinnewcontext-code-injection
    vm.runInNewContext(code)
}

function okTest3(userInput) {
    const code = `
        var x = 1;
    `
// ok: vm-runinnewcontext-code-injection
    vm.runInNewContext(code)
}
