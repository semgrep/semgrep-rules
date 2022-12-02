const vm = require('vm')
const { runInContext } = require('vm')

function test1(userInput) {
  var input = userInput.something || ''
  var sandbox = {
    foo: input
  }
  vm.createContext(sandbox)
  //ruleid: vm-runincontext-context-injection
  vm.runInContext('safeEval(orderLinesData)', sandbox, { timeout: 2000 })
}

foo(function(userInput) {
  var sandbox = {
    foo: userInput
  }
  vm.createContext(sandbox)
  //ruleid: vm-runincontext-context-injection
  runInContext('safeEval(orderLinesData)', sandbox, { timeout: 2000 })
})

function testOk1(userInput) {
  var sandbox = {
    foo: 1
  }
  vm.createContext(sandbox)
  vm.runInContext('safeEval(orderLinesData)', sandbox, { timeout: 2000 })
}

function test2(userInput) {
  var input = userInput.something || ''
  var sandbox = {
    foo: input
  }
  //ruleid: vm-runincontext-context-injection
  vm.runInNewContext('safeEval(orderLinesData)', sandbox, { timeout: 2000 })
}

foo(function(userInput) {
  var sandbox = {
    foo: userInput
  }
  //ruleid: vm-runincontext-context-injection
  vm.runInNewContext('safeEval(orderLinesData)', sandbox, { timeout: 2000 })
})

function testOk1(userInput) {
  var sandbox = {
    foo: 1
  }
  vm.runInNewContext('safeEval(orderLinesData)', sandbox, { timeout: 2000 })
}

function test3(userInput) {
  const code = `
        var x = ${userInput};
    `
  //ruleid: vm-runincontext-context-injection
  vm.runInThisContext(code)
}

function okTest3(userInput) {
  const code = `
        var x = 1;
    `
  vm.runInThisContext(code)
}

function test4(userInput) {
  const parsingContext = vm.createContext({ name: 'world' })
  const code = `return 'hello ' + ${userInput}`
  //ruleid: vm-runincontext-context-injection
  const fn = vm.compileFunction(code, [], { parsingContext })
}

function okTest4(userInput) {
  const parsingContext = vm.createContext({ name: 'world' })
  const code = `return 'hello ' + name`
  const fn = vm.compileFunction(code, [], { parsingContext })
}

function test5(userInput) {
  const context = vm.createContext({ name: userInput })
  const code = `return 'hello ' name`
  //ruleid: vm-runincontext-context-injection
  const fn = vm.compileFunction(code, [], { parsingContext: context })
}

function okTest5(userInput) {
  const parsingContext = vm.createContext({ name: 'world' })
  const code = `return 'hello ' + name`
  const fn = vm.compileFunction(code, [], { parsingContext })
}

function test6(userInput) {
  //ruleid: vm-runincontext-context-injection
  const script = new vm.Script(`
        function add(a, b) {
          return a + ${userInput};
        }
        const x = add(1, 2);
    `);

  script.runInThisContext();
}

function okTest6(userInput) {
  const script = new vm.Script(`
        function add(a, b) {
          return a + b;
        }
        const x = add(1, 2);
    `);

  script.runInThisContext();
}

async function test6(userInput) {
  const contextifiedObject = vm.createContext({ secret: 42 });

  const module = new vm.SourceTextModule(
    //ruleid: vm-runincontext-context-injection
    `Object.getPrototypeOf(import.meta.prop).secret = ${userInput};`,
    {
      initializeImportMeta(meta) {
        meta.prop = {};
      }
    });
  await module.link(() => { });
  await module.evaluate();
}

