const {readFile} = require('fs/promises')
const fs = require('fs')

function test1(fileName) {
  // ruleid:detect-non-literal-fs-filename
  readFile(fileName)
    .then((resolve, reject) => {
      foobar()
    })
}

async function test2(fileName) {
  // ruleid:detect-non-literal-fs-filename
  const data = await fs.promises.mkdir(fileName, {})
  foobar(data)
}

function test3(fileName) {
  const data = new Uint8Array(Buffer.from('Hello Node.js'));
  // ruleid:detect-non-literal-fs-filename
  fs.writeFile(fileName, data, (err) => {
    if (err) throw err;
    console.log('The file has been saved!');
  });
}

function okTest1(data) {
  const data = new Uint8Array(Buffer.from('Hello Node.js'));
  // ok:detect-non-literal-fs-filename
  fs.writeFile('message.txt', data, (err) => {
    if (err) throw err;
    console.log('The file has been saved!');
  });
}

async function okTest2() {
  let filehandle;
  try {
    // ok:detect-non-literal-fs-filename
    filehandle = await fs.promises.open('thefile.txt', 'r');
  } finally {
    if (filehandle !== undefined)
      await filehandle.close();
  }
}

async function okTest3() {
  let filehandle;
  try {
    // ok:detect-non-literal-fs-filename
    filehandle = await this.open();
  } finally {
    if (filehandle !== undefined)
      await filehandle.close();
  }
}