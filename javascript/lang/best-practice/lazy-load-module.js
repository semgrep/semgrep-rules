// ok: lazy-load-module
const fs = require('fs')

function smth() {
  // ruleid: lazy-load-module
  const mod = require('module-name')
  return mod();
}
