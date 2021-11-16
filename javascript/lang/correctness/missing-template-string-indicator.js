function name() {
  // ok: missing-template-string-indicator
  return `this is ${start.line}`
}

function ok() {
  // ok: missing-template-string-indicator
  `test`;
  if (true) { a = 3; }
  `test`;
}

function name2() {
  // ruleid: missing-template-string-indicator
  return `this is {start.line}`
}

function name3() {
  // ok: missing-template-string-indicator
  return "this is ${start.line}"
}


function name3() {
  // ok: missing-template-string-indicator
  return "this is {start.line}"
}
