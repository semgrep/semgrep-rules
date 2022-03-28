const fs = require('fs');
const {VM, NodeVM} = require('vm2');
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => res.send('Hello World!'))

app.get('/test1', (req, res) => {
  code = `
    console.log(${req.query.input})
  `;

  const sandbox = {
    setTimeout,
    fs: {
      watch: fs.watch
    }
  };

  // ruleid:express-vm2-injection
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

  const nodeVM = new NodeVM({timeout: 40 * 1000, sandbox});
  // ruleid:express-vm2-injection
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

  const nodeVM = new NodeVM({timeout: 40 * 1000, sandbox});
  // ruleid:express-vm2-injection
  const script = new VMScript(`console.log(${req.query.input})`)
  // ruleid:express-vm2-injection
  nodeVM.run(script)

  res.send('hello world')
})

app.get('/ok-test1', async function (req, res) {
  code = `
    console.log("Hello world")
  `;

  const sandbox = {
    setTimeout,
    fs: {
      watch: fs.watch
    }
  };

  const vmResult = new VM({
    timeout: 40 * 1000,
    sandbox
  }).run(code);

  res.send('hello world');
})

app.get('/ok-test2', function (req, res) {
  const sandbox = {
    setTimeout,
    fs: {
      watch: fs.watch
    }
  };

  const nodeVM = new NodeVM({timeout: 40 * 1000, sandbox});
  nodeVM.run('console.log("Hello world")')

  res.send('hello world');
})

app.get('/ok-test3', function (req, res) {
  const sandbox = {
    setTimeout,
    fs: {
      watch: fs.watch
    }
  };

  const nodeVM = new NodeVM({timeout: 40 * 1000, sandbox});
  const script = new VMScript('console.log("Hello world")')
  nodeVM.run(script)

  res.send('hello world');
})


app.get('/test4', async function test1(req, res) {
  code = `
    console.log("Hello world")
  `;

  const sandbox = {
    setTimeout,
    watch: req.query.input
  };

  // ruleid:express-vm2-injection
  return new VM({timeout: 40 * 1000, sandbox}).run(code);
})

app.post('/test5', function test2(req, res) {
  const sandbox = {
    setTimeout,
    input: req.body
  };

  // ruleid:express-vm2-injection
  const nodeVM = new NodeVM({timeout: 40 * 1000, sandbox});
  return nodeVM
})

// ok:express-vm2-injection
app.get('/ok-test4', async function okTest1() {
  code = `
    console.log("Hello world")
  `;

  const sandbox = {
    setTimeout,
    fs
  };

  return new VM({timeout: 40 * 1000, sandbox}).run(code);
})

// ok:express-vm2-injection
app.get('/ok-test5', function okTest2() {
  const sandbox = {
    setTimeout,
    fs
  };

  const nodeVM = new NodeVM({timeout: 40 * 1000, sandbox});
  return nodeVM.run('console.log("Hello world")')
})

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))
