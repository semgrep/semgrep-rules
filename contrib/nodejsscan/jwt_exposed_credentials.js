//jose
function example30() {
    // ruleid: jwt_exposed_credentials
    const jose = require('jose')
    const { JWK, JWT } = jose
    const token1 = JWT.sign({ password: 123 }, 'secret', { some: 'params' })
}

function example31() {
    // ruleid: jwt_exposed_credentials
    const jose = require('jose')
    const { JWK, JWT } = jose
    const payload = { one: 1, two: 2, password: 123 }
    const token1 = JWT.sign(payload, 'secret', { some: 'params' })
}

function example32() {
    // ruleid: jwt_exposed_credentials
    const jose = require('jose')
    const { JWK, JWT } = jose
    let payload;
    payload = { one: 1, two: 2, password: 123 }
    const token1 = JWT.sign(payload, 'secret', { some: 'params' })
}

function example33() {
    // ruleid: jwt_exposed_credentials
    const jose = require('jose')
    const { JWK, JWT } = jose
    const payload = {}
    payload.password = 123
    const token1 = JWT.sign(payload, 'secret', { some: 'params' })
}

function example34() {
    // ruleid: jwt_exposed_credentials
    const jose = require('jose')
    const { JWK, JWT } = jose
    const payload = Object.assign({ password: 'bar' }, { bar: 123 }, { one: 1, two: 2 })
    const token1 = JWT.sign(payload, 'secret', { some: 'params' })
}

function example35() {
    // ruleid: jwt_exposed_credentials
    const jose = require('jose')
    const { JWK, JWT } = jose
    let payload;
    payload = Object.assign({ password: 'bar' }, { bar: 123 }, { one: 1, two: 2 })
    const token1 = JWT.sign(payload, 'secret', { some: 'params' })
}

function example36() {
    // ruleid: jwt_exposed_credentials
    const jose = require('jose')
    const { JWK, JWT } = jose
    const token1 = JWT.sign(Object.assign({ password: 'bar' }, { bar: 123 }, { one: 1, two: 2 }), 'secret', { some: 'params' })
}

function example37() {
    // ruleid: jwt_exposed_credentials
    const jose = require('jose')
    const { JWK, JWT } = jose
    const token1 = JWT.sign({ user: { password: 123 } }, 'secret', { some: 'params' })
}

function example38() {
    // ruleid: jwt_exposed_credentials
    const jose = require('jose')
    const { JWK, JWT } = jose
    const payload = { one: 1, two: 2, user: { password: 123 } }
    const token1 = JWT.sign(payload, 'secret', { some: 'params' })
}

function example39() {
    // ruleid: jwt_exposed_credentials
    const jose = require('jose')
    const { JWK, JWT } = jose
    let payload;
    payload = { one: 1, two: 2, user: { password: 123 } }
    const token1 = JWT.sign(payload, 'secret', { some: 'params' })
}

function example40() {
    // ruleid: jwt_exposed_credentials
    const jose = require('jose')
    const { JWK, JWT } = jose
    const payload = { user: {} }
    payload.user.password = 123
    const token1 = JWT.sign(payload, 'secret', { some: 'params' })
}

function example41() {
    // ruleid: jwt_exposed_credentials
    const jose = require('jose')
    const { JWK, JWT } = jose
    const payload = Object.assign({ user: { password: 123 } }, { bar: 123 }, { one: 1, two: 2 })
    const token1 = JWT.sign(payload, 'secret', { some: 'params' })
}

function example42() {
    // ruleid: jwt_exposed_credentials
    const jose = require('jose')
    const { JWK, JWT } = jose
    let payload;
    payload = Object.assign({ user: { password: 123 } }, { bar: 123 }, { one: 1, two: 2 })
    const token1 = JWT.sign(payload, 'secret', { some: 'params' })
}

function example43() {
    // ruleid: jwt_exposed_credentials
    const jose = require('jose')
    const { JWK, JWT } = jose
    const token1 = JWT.sign(Object.assign({ user: { password: 123 } }, { bar: 123 }, { one: 1, two: 2 }), 'secret', { some: 'params' })
}
