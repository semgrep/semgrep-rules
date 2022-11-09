const config = require('./config')

function example1() {
  const jose = require('jose')
  const { JWT } = jose
  const payload = {foo: 'bar'}
  // ruleid: hardcoded-jwt-secret
  JWT.verify(payload, 'shhhhh')
}

function example2() {
  const jose = require('jose')
  const { JWT } = jose
  const payload = {foo: 'bar'}
  // ruleid: hardcoded-jwt-secret
  const token2 = JWT.sign(payload, 'shhhhh')
}

function example3() {
  const jose = require('jose')
  const { JWT } = jose
  const payload = {foo: 'bar'}
  // ruleid: hardcoded-jwt-secret
  const token3 = JWT.verify(payload, 'shhhhh')
}

function example4() {
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  // ruleid: hardcoded-jwt-secret
  JWT.verify(payload, JWK.asKey('raz-dva-tri'))
}

function example5() {
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  // ruleid: hardcoded-jwt-secret
  const token5 = JWT.sign(payload, JWK.asKey('raz-dva-tri'))
}

function example6() {
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  // ruleid: hardcoded-jwt-secret
  const token6 = JWT.verify(payload, JWK.asKey('raz-dva-tri'))
}

function example7() {
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const key7 = JWK.asKey('raz-dva-tri')
  // ruleid: hardcoded-jwt-secret
  JWT.verify(payload, key7)
}

function example8() {
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const key8 = JWK.asKey('raz-dva-tri')
  // ruleid: hardcoded-jwt-secret
  const token8 = JWT.sign(payload, key8)
}

function example9() {
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const key9 = JWK.asKey('raz-dva-tri')
  // ruleid: hardcoded-jwt-secret
  const token9 = JWT.verify(payload, key9)
}

function example10() {
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const secret10 = 'shhhhh'
  // ruleid: hardcoded-jwt-secret
  JWT.verify(payload, secret10)
}

function example11() {
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const secret11 = 'shhhhh'
  // ruleid: hardcoded-jwt-secret
  const token11 = JWT.sign(payload, secret11)
}

function example12() {
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const secret12 = 'shhhhh'
  // ruleid: hardcoded-jwt-secret
  const token3 = JWT.verify(payload, secret12)
}

function example13() {
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const secret13 = 'shhhhh'
  // ruleid: hardcoded-jwt-secret
  JWT.verify(payload, JWK.asKey(secret13))
}
 
function example14() {
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const secret14 = 'shhhhh'
  // ruleid: hardcoded-jwt-secret
  const token5 = JWT.sign(payload, JWK.asKey(secret14))
}

function example15() {
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const secret15 = 'shhhhh'
  // ruleid: hardcoded-jwt-secret
  const token6 = JWT.verify(payload, JWK.asKey(secret15))
}

function example16() {
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const secret16 = 'shhhhh'
  const key16 = JWK.asKey(secret16)
  // ruleid: hardcoded-jwt-secret
  JWT.verify(payload, key16)
}

function example17() {
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const secret17 = 'shhhhh'
  const key17 = JWK.asKey(secret17)
  // ruleid: hardcoded-jwt-secret
  const token8 = JWT.sign(payload, key17)
}

function example18() {
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const secret18 = 'shhhhh'
  const key18 = JWK.asKey(secret18)
  // ruleid: hardcoded-jwt-secret
  const token9 = JWT.verify(payload, key18)
}

function example10() {
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const secret2 = config.secret
  // ok: hardcoded-jwt-secret
  const token11 = JWT.sign(payload, JWK.asKey(secret2))
}

function example11() {
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const secret2 = config.secret
  // ok: hardcoded-jwt-secret
  const token12 = JWT.sign(payload, secret2)
}
