const config = require('./config')

function example1() {
// ruleid: hardcoded-jwt-secret
  const jsonwt = require('jsonwebtoken')
  const payload = {foo: 'bar'}
  const secret = 'shhhhh'
  const token1 = jsonwt.sign(payload, secret)
}

function example2() {
// ruleid: hardcoded-jwt-secret
  const jsonwt = require('jsonwebtoken')
  const payload = {foo: 'bar'}
  const token2 = jsonwt.sign(payload, 'some-secret')
}

function example3() {
// ok
  const jsonwt = require('jsonwebtoken')
  const payload = {foo: 'bar'}
  const token3 = jsonwt.sign(payload, config.secret)
}

function example4() {
// ok
  const jsonwt = require('jsonwebtoken')
  const payload = {foo: 'bar'}
  const secret2 = config.secret
  const token4 = jsonwt.sign(payload, secret2)
}

function example5() {
// ok
  const jsonwt = require('jsonwebtoken')
  const payload = {foo: 'bar'}
  const secret3 = process.env.SECRET || 'fallback-secret'
  const token5 = jsonwt.sign(payload, secret3)
}

function example6() {
// ruleid: hardcoded-jwt-secret
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const secret = 'shhhhh'
  const token6 = JWT.sign(payload, JWK.asKey(secret))
}

function example7() {
// ruleid: hardcoded-jwt-secret
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const token7 = JWT.sign(payload, JWK.asKey('raz-dva-tri'))
}

function example8() {
// ruleid: hardcoded-jwt-secret
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const secret = 'shhhhh'
  const token8 = JWT.sign(payload, secret)
}

function example9() {
// ruleid: hardcoded-jwt-secret
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const token9 = JWT.sign(payload, 'secret-again')
}

function example10() {
// ok
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const secret2 = config.secret
  const token11 = JWT.sign(payload, JWK.asKey(secret2))
}

function example11() {
// ok
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const secret2 = config.secret
  const token12 = JWT.sign(payload, secret2)
}
