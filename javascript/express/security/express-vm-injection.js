const vm = require('vm')

let ctrl1 = function test1(req,res) {
    var input = req.query.something || ''
    var sandbox = {
        foo: input
    }
    vm.createContext(sandbox)
    // ruleid:express-vm-injection
    vm.runInContext('safeEval(orderLinesData)', sandbox, { timeout: 2000 })
    res.send('hello world')
}
app.get('/', ctrl1)

app.get('/', (req,res) => {
    var sandbox = {
        foo: req.query.userInput
    }
    vm.createContext(sandbox)
    // ruleid:express-vm-injection
    vm.runInContext('safeEval(orderLinesData)', sandbox, { timeout: 2000 })
    res.send('hello world')
})

// ok:express-vm-injection
function testOk1(userInput) {
    var sandbox = {
        foo: 1
    }
    vm.createContext(sandbox)
    vm.runInContext('safeEval(orderLinesData)', sandbox, { timeout: 2000 })
}

var ctrl2 = null;
ctrl2 = function test2(req,res) {
    var input = req.query.something || ''
    var sandbox = {
        foo: input
    }
    // ruleid:express-vm-injection
    vm.runInNewContext('safeEval(orderLinesData)', sandbox, { timeout: 2000 })
    res.send('hello world')
}
app.get('/', ctrl2)


app.get('/', function (req,res) {
    var sandbox = {
        foo: req.query.userInput
    }
    // ruleid:express-vm-injection
    vm.runInNewContext('safeEval(orderLinesData)', sandbox, { timeout: 2000 })
    res.send('hello world')
})

// ok:express-vm-injection
app.get('/', function testOk1(userInput) {
    var sandbox = {
        foo: 1
    }
    vm.runInNewContext('safeEval(orderLinesData)', sandbox, { timeout: 2000 })
    res.send('hello world')
})

app.get('/', function(req,res) {
    const code = `
        var x = ${req.query.userInput};
    `
    // ruleid:express-vm-injection
    vm.runInThisContext(code)
    res.send('hello world')
})

// ok:express-vm-injection
app.get('/', function okTest3(req,res) {
    const code = `
        var x = 1;
    `
    vm.runInThisContext(code)
    res.send('hello world')
})

app.get('/', function test4(req,res) {
    const parsingContext = vm.createContext({name: 'world'})
    const code = `return 'hello ' + ${req.query.userInput}`
    // ruleid:express-vm-injection
    let fn = vm.compileFunction(code, [], { parsingContext })
    res.send('hello world')
})

// ok:express-vm-injection
app.get('/', function okTest4(req,res) {
    const parsingContext = vm.createContext({name: 'world'})
    const code = `return 'hello ' + name`
    const fn = vm.compileFunction(code, [], { parsingContext })
})

app.get('/', (req,res) => {
    const context = vm.createContext({name: req.query.userInput})
    let code = `return 'hello ' name`
    // ruleid:express-vm-injection
    const fn = vm.compileFunction(code, [], { parsingContext: context })
    res.send('hello world')
})

// ok:express-vm-injection
app.get('/', function okTest5(req, res) {
    const parsingContext = vm.createContext({name: 'world'})
    const code = `return 'hello ' + name`
    const fn = vm.compileFunction(code, [], { parsingContext })
    res.send('hello world')
})

app.get('/', function (req,res) {
    // ruleid:express-vm-injection
    const script = new vm.Script(`
        function add(a, b) {
          return a + ${req.query.userInput};
        }

        const x = add(1, 2);
    `);

    script.runInThisContext();
    res.send('hello world')
})

//ok:express-vm-injection
app.get('/', function okTest6(req, res) {
    const script = new vm.Script(`
        function add(a, b) {
          return a + b;
        }

        const x = add(1, 2);
    `);

    script.runInThisContext();
    res.send('hello world')
})
