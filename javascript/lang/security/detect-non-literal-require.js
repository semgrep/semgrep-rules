// ok:detect-non-literal-require
var a = require('b')

// ok:detect-non-literal-require
var a = require(process.env.VAR)

// ruleid:detect-non-literal-require
var a = require(c)
