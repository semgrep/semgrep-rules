function name() {
  // ok: missing-template-string-indicator
  return `this is ${start.line}`
}

function name2() {
  // ruleid: missing-template-string-indicator
  return `this is {start.line}`
}
