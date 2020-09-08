const vm = require('vm')

let ctrl1 = function test1(req, res) {
    // ruleid:vm_runincontext_injection
    var input = req.query.something || ''
    var sandbox = {
        foo: input
    }
    vm.createContext(sandbox)
    vm.runInContext('safeEval(orderLinesData)', sandbox, { timeout: 2000 })
    res.send('hello world')
}
app.get('/', ctrl1)

app.get('/', (req, res) => {
    // ruleid:vm_runincontext_injection
    var sandbox = {
        foo: req.query.userInput
    }
    vm.createContext(sandbox)
    vm.runInContext('safeEval(orderLinesData)', sandbox, { timeout: 2000 })
    res.send('hello world')
})

var ctrl2 = null;
ctrl2 = function test2(req, res) {
    // ruleid:vm_runinnewcontext_injection
    var input = req.query.something || ''
    var sandbox = {
        foo: input
    }
    vm.runInNewContext('safeEval(orderLinesData)', sandbox, { timeout: 2000 })
    res.send('hello world')
}
app.get('/', ctrl2)


app.get('/', function (req, res) {
    // ruleid:vm_runinnewcontext_injection
    var sandbox = {
        foo: req.query.userInput
    }
    vm.runInNewContext('safeEval(orderLinesData)', sandbox, { timeout: 2000 })
    res.send('hello world')
})


app.get('/', function (req, res) {
    // ruleid:vm_code_injection
    const code = `
        var x = ${req.query.userInput};
    `
    vm.runInThisContext(code)
    res.send('hello world')
})


app.get('/', function test4(req, res) {
    const parsingContext = vm.createContext({ name: 'world' })
    // ruleid:vm_code_injection
    const code = `return 'hello ' + ${req.query.userInput}`
    let fn = vm.compileFunction(code, [], { parsingContext })
    res.send('hello world')
})


app.get('/', (req, res) => {
    // ruleid:vm_compilefunction_injection
    const context = vm.createContext({ name: req.query.userInput })
    let code = `return 'hello ' name`
    const fn = vm.compileFunction(code, [], { parsingContext: context })
    res.send('hello world')
})

app.get('/', function (req, res) {
    // ruleid:vm_code_injection
    const script = new vm.Script(`
        function add(a, b) {
          return a + ${req.query.userInput};
        }

        const x = add(1, 2);
    `);

    script.runInThisContext();
    res.send('hello world')
})
