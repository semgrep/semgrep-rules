const vm = require('vm')

function test4(userInput) {
    const parsingContext = vm.createContext({name: 'world'})
    const code = `return 'hello ' + ${userInput}`
// ruleid: vm-compilefunction-code-injection
    const fn = vm.compileFunction(code, [], { parsingContext })
}

function okTest4(userInput) {
    const parsingContext = vm.createContext({name: 'world'})
    const code = `return 'hello ' + name`
// ok: vm-compilefunction-code-injection
    const fn = vm.compileFunction(code, [], { parsingContext })
}
