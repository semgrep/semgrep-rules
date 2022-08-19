function test1(req,res) {
  const data = JSON.stringify(req.query.key);
  const command = `(secret) => {${data}}`
  // ruleid:code-string-concat
  return eval(command)
}

test2.post(foo, bar, function (req,res) {
  userInput = req.params.input
  var command = "new Function('"+userInput+"')";
  // ruleid:code-string-concat
  return eval(command)
});

function ok1(req,res) {
  var command = "eval('123')";
  // ok:code-string-concat
  return eval(command)
}