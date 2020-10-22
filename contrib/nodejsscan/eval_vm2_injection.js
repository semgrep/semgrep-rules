const fs = require('fs');
const { VM, NodeVM } = require('vm2');
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => res.send('Hello World!'))

app.get('/test1', (req, res) => {
    // ruleid:vm2_code_injection
    code = `
    console.log(${req.query.input})
  `;

    const sandbox = {
        setTimeout,
        fs: {
            watch: fs.watch
        }
    };

    new VM({
        timeout: 40 * 1000,
        sandbox
    }).run(code);

    res.send('hello world');
})

app.get('/test2', function (req, res) {
    const sandbox = {
        setTimeout,
        fs: {
            watch: fs.watch
        }
    };


    const nodeVM = new NodeVM({ timeout: 40 * 1000, sandbox });
    // ruleid:vm2_code_injection
    nodeVM.run('console.log(' + req.query.input + ')')

    res.send('hello world');
})

app.get('/test3', function (req, res) {
    const sandbox = {
        setTimeout,
        fs: {
            watch: fs.watch
        }
    };

    const nodeVM = new NodeVM({ timeout: 40 * 1000, sandbox });
    // ruleid:vm2_code_injection
    const script = new VMScript(`console.log(${req.query.input})`)
    nodeVM.run(script)

    res.send('hello world')
})


app.get('/test4', async function test1(req, res) {
    code = `
    console.log("Hello world")
  `;

    // ruleid:vm2_context_injection
    const sandbox = {
        setTimeout,
        watch: req.query.input
    };

    return new VM({ timeout: 40 * 1000, sandbox }).run(code);
})

app.post('/test5', function test2(req, res) {
    // ruleid:vm2_context_injection
    const sandbox = {
        setTimeout,
        input: req.body
    };

    const nodeVM = new NodeVM({ timeout: 40 * 1000, sandbox });
    return nodeVM.run('console.log("Hello world")')
})


app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))
