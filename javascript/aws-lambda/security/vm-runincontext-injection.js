const vm = require('vm')

exports.handler = async (event) => {
    var input = event['something']
    var sandbox = {
        foo: input
    }
    // ruleid: vm-runincontext-injection
    vm.runInNewContext('safeEval(orderLinesData)', sandbox, { timeout: 2000 })


    const code = `
        var x = ${event['something']};
    `
    // ruleid: vm-runincontext-injection
    vm.runInThisContext(code)


    const parsingContext = vm.createContext({name: 'world'})
    const code1 = `return 'hello ' + '${event['something']}'`
    // ruleid: vm-runincontext-injection
    const fn1 = vm.compileFunction(code1, [], { parsingContext })


    const context = vm.createContext({name: event['something']})
    const code2 = `return 'hello ' name`
    // ruleid: vm-runincontext-injection
    const fn2 = vm.compileFunction(code2, [], { parsingContext: context })


    // ruleid: vm-runincontext-injection
    const script = new vm.Script(`
        function add(a, b) {
          return a + ${event['something']};
        }

        const x = add(1, 2);
    `);
    script.runInThisContext();


    // ok: vm-runincontext-injection
    var sandbox2 = {
        foo: 1
    }
    vm.createContext(sandbox2)
    vm.runInContext('safeEval(orderLinesData)', sandbox2, { timeout: 2000 })


    // ok: vm-runincontext-injection
    var sandbox3 = {
        foo: 1
    }
    vm.runInNewContext('safeEval(orderLinesData)', sandbox3, { timeout: 2000 })


    const code2 = `
        var x = 1;
    `
    // ok: vm-runincontext-injection
    vm.runInThisContext(code2)


    const parsingContext = vm.createContext({name: 'world'})
    const code3 = `return 'hello ' + name`
    // ok: vm-runincontext-injection
    const fn3 = vm.compileFunction(code3, [], { parsingContext })


    // ok: vm-runincontext-injection
    const script1 = new vm.Script(`
        function add(a, b) {
          return a + b;
        }

        const x = add(1, 2);
    `);

    script1.runInThisContext();
}