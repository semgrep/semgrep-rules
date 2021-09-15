const util = require('util')

function test1(data) {
  const {user, ip} = data
  foobar(user)
  // ruleid: unsafe-formatstring
  console.log("Unauthorized access attempt by " + user, ip);
}

function test2(data) {
  const {user, ip} = data
  foobar(user)
  const logs = `Unauthorized access attempt by ${user}`
  // ruleid: unsafe-formatstring
  console.log(logs, ip);
}

function test3(data) {
  const {user, ip} = data
  foobar(user)
  const logs = `Unauthorized access attempt by ${user} %d`
  // ruleid: unsafe-formatstring
  return util.format(logs, ip);
}

function okTest1(data) {
  const {user, ip} = data
  foobar(user)
  const logs = `Unauthorized access attempt by user`
  // ok: unsafe-formatstring
  console.log(logs, ip);
}

function okTest2(data) {
  const {user, ip} = data
  foobar(user)
  // ok: unsafe-formatstring
  console.log("Unauthorized access attempt by " + user);
}

function okTest3(data) {
  const {user, ip} = data
  foobar(user)
  // ok: unsafe-formatstring
  return util.format("Unauthorized access attempt by %d", ip);
}
