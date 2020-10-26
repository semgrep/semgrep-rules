const config = require('./config')

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
  // ok: hardcoded-jwt-secret
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const secret2 = config.secret
  const token11 = JWT.sign(payload, JWK.asKey(secret2))
}

function example11() {
  // ok: hardcoded-jwt-secret
  const jose = require('jose')
  const { JWK, JWT } = jose
  const payload = {foo: 'bar'}
  const secret2 = config.secret
  const token12 = JWT.sign(payload, secret2)
}
