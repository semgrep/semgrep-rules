const jsonwt = require('jsonwebtoken')
const jose = require('jose')
const { JWK, JWT } = jose
const config = require('./config')

const payload = {foo: 'bar'}
const secret = 'shhhhh'

const secret2 = config.secret
const secret3 = process.env.SECRET || 'fallback-secret'

//jsonwebtoken
//true
const token1 = jsonwt.sign(payload, secret)
//true
const token2 = jsonwt.sign(payload, 'some-secret')
//false
const token3 = jsonwt.sign(payload, config.secret)
//false
const token4 = jsonwt.sign(payload, secret2)
//??
const token5 = jsonwt.sign(payload, secret3)

//jose
//true
const token6 = JWT.sign(payload, JWK.asKey(secret))
//true
const token7 = JWT.sign(payload, JWK.asKey('raz-dva-tri'))
//true
const token8 = JWT.sign(payload, secret)
//true
const token9 = JWT.sign(payload, 'secret-again')
//false
const token11 = JWT.sign(payload, JWK.asKey(secret2))
//false
const token12 = JWT.sign(payload, secret2)