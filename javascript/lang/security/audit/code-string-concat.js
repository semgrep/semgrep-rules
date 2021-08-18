function test1() {
  const data = JSON.stringify(key);
  // ruleid:code-string-concat
  return exec(`(function(){${data}})`)
}

function test2() {
  const data = JSON.stringify(key);

  // ruleid:code-string-concat
  const command = `(secret) => {${data}}`
  return exec(command)
}

function test3(userInput) {
  // ruleid:code-string-concat
  var command = "new Function('"+userInput+"')";
  return exec(command)
}

function test4(userInput) {
  // ruleid:code-string-concat
  var command = "eval('"+userInput+"')";
  return exec(command)
}

function ok1() {
  var command = "eval('123')";
  return exec(command)
}

function ok1() {
  var command = "eval('123')";
  return exec(command)
}
