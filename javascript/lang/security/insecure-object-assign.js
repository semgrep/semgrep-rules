function test1(untrustedInput) {
  // ruleid: insecure-object-assign
  let data = Object.assign(systemData, JSON.parse(untrustedInput))
  return doSmthWith(data)
}

function test2(untrustedInput) {
  const jsonData = JSON.parse(untrustedInput)
  // ruleid: insecure-object-assign
  let data = Object.assign(systemData, {foo: true}, jsonData)
  return doSmthWith(data)
}

function okTest1() {
  const jsonData = JSON.parse('{"one": 1}')
  // ok: insecure-object-assign
  let data = Object.assign(systemData, {foo: true}, jsonData)
  return doSmthWith(data)
}

function okTest2() {
  const input = '{"one": 1}'
  const jsonData = JSON.parse(input)
  // ok: insecure-object-assign
  let data = Object.assign(systemData, {foo: true}, jsonData)
  return doSmthWith(data)
}
