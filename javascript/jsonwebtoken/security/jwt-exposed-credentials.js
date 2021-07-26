const jsonwt = require('jsonwebtoken')

function example1 () {
    // ruleid: jwt-exposed-credentials
    const token1 = jsonwt.sign({password: 123}, 'secret', {some: 'params'})
}

function example2 () {
    // ruleid: jwt-exposed-credentials
    const payload = {one: 1, two: 2, password: 123}
    const token1 = jsonwt.sign(payload, 'secret', {some: 'params'})
}

function example3 () {
    let payload;
    // ruleid: jwt-exposed-credentials
    payload = {one: 1, two: 2, password: 123}
    const token1 = jsonwt.sign(payload, 'secret', {some: 'params'})
}

function example4 () {
    const payload = {}
    // ruleid: jwt-exposed-credentials
    payload.password = 123
    const token1 = jsonwt.sign(payload, 'secret', {some: 'params'})
}

function example5 () {
    // ruleid: jwt-exposed-credentials
    const payload = Object.assign({password: 'bar'}, {bar: 123}, {one: 1, two: 2})
    const token1 = jsonwt.sign(payload, 'secret', {some: 'params'})
}

function example6 () {
    let payload;
    // ruleid: jwt-exposed-credentials
    payload = Object.assign({password: 'bar'}, {bar: 123}, {one: 1, two: 2})
    const token1 = jsonwt.sign(payload, 'secret', {some: 'params'})
}

function example7 () {
    // ruleid: jwt-exposed-credentials
    const token1 = jsonwt.sign(Object.assign({password: 'bar'}, {bar: 123}, {one: 1, two: 2}), 'secret', {some: 'params'})
}

function example8 () {
    // ruleid: jwt-exposed-credentials
    const token1 = jsonwt.sign({user: {password: 123}}, 'secret', {some: 'params'})
}

function example9 () {
    // ruleid: jwt-exposed-credentials
    const payload = {one: 1, two: 2, user: {password: 123}}
    const token1 = jsonwt.sign(payload, 'secret', {some: 'params'})
}

function example10 () {
    let payload;
    // ruleid: jwt-exposed-credentials
    payload = {one: 1, two: 2, user: {password: 123}}
    const token1 = jsonwt.sign(payload, 'secret', {some: 'params'})
}

function example11 () {
    const payload = {user:{}}
    // ruleid: jwt-exposed-credentials
    payload.user.password = 123
    const token1 = jsonwt.sign(payload, 'secret', {some: 'params'})
}

function example12 () {
    // ruleid: jwt-exposed-credentials
    const payload = Object.assign({user: {password: 123}}, {bar: 123}, {one: 1, two: 2})
    const token1 = jsonwt.sign(payload, 'secret', {some: 'params'})
}

function example13 () {
    let payload;
    // ruleid: jwt-exposed-credentials
    payload = Object.assign({user: {password: 123}}, {bar: 123}, {one: 1, two: 2})
    const token1 = jsonwt.sign(payload, 'secret', {some: 'params'})
}

function example14 () {
    // ruleid: jwt-exposed-credentials
    const token1 = jsonwt.sign(Object.assign({user: {password: 123}}, {bar: 123}, {one: 1, two: 2}), 'secret', {some: 'params'})
}

function example15 () {
    // ruleid: jwt-exposed-credentials
    jsonwt.sign({password: 123}, 'secret', {some: 'params'}, () => {})
}

function example16 () {
    // ruleid: jwt-exposed-credentials
    const payload = {one: 1, two: 2, password: 123}
    jsonwt.sign(payload, 'secret', {some: 'params'}, () => {})
}

function example17 () {
    let payload;
    // ruleid: jwt-exposed-credentials
    payload = {one: 1, two: 2, password: 123}
    jsonwt.sign(payload, 'secret', {some: 'params'}, () => {})
}

function example18 () {
    const payload = {}
    // ruleid: jwt-exposed-credentials
    payload.password = 123
    jsonwt.sign(payload, 'secret', {some: 'params'}, () => {})
}

function example19 () {
    // ruleid: jwt-exposed-credentials
    const payload = Object.assign({password: 'bar'}, {bar: 123}, {one: 1, two: 2})
    jsonwt.sign(payload, 'secret', {some: 'params'}, () => {})
}

function example20 () {
    let payload;
    // ruleid: jwt-exposed-credentials
    payload = Object.assign({password: 'bar'}, {bar: 123}, {one: 1, two: 2})
    jsonwt.sign(payload, 'secret', {some: 'params'}, () => {})
}

function example21 () {
    // ruleid: jwt-exposed-credentials
    jsonwt.sign(Object.assign({password: 'bar'}, {bar: 123}, {one: 1, two: 2}), 'secret', {some: 'params'}, () => {})
}

function example22 () {
    // ruleid: jwt-exposed-credentials
    jsonwt.sign({user: {password: 123}}, 'secret', {some: 'params'}, () => {})
}

function example23 () {
    // ruleid: jwt-exposed-credentials
    const payload = {one: 1, two: 2, user: {password: 123}}
    jsonwt.sign(payload, 'secret', {some: 'params'}, () => {})
}

function example24 () {
    let payload;
    // ruleid: jwt-exposed-credentials
    payload = {one: 1, two: 2, user: {password: 123}}
    jsonwt.sign(payload, 'secret', {some: 'params'}, () => {})
}

function example25 () {
    const payload = {user:{}}
    // ruleid: jwt-exposed-credentials
    payload.user.password = 123
    jsonwt.sign(payload, 'secret', {some: 'params'}, () => {})
}

function example26 () {
    // ruleid: jwt-exposed-credentials
    const payload = Object.assign({user: {password: 123}}, {bar: 123}, {one: 1, two: 2})
    jsonwt.sign(payload, 'secret', {some: 'params'}, () => {})
}

function example27 () {
    let payload;
    // ruleid: jwt-exposed-credentials
    payload = Object.assign({user: {password: 123}}, {bar: 123}, {one: 1, two: 2})
    jsonwt.sign(payload, 'secret', {some: 'params'}, () => {})
}

function example28 () {
    // ruleid: jwt-exposed-credentials
    jsonwt.sign(Object.assign({user: {password: 123}}, {bar: 123}, {one: 1, two: 2}), 'secret', {some: 'params'}, () => {})
}

function example29 () {
    // ruleid: jwt-exposed-credentials
    some.token = jsonwt.sign(Object.assign({user: {password: 123}}, {bar: 123}, {one: 1, two: 2}), 'secret', {some: 'params'}, () => {})
}
