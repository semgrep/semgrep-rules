const jsonwt = require('jsonwebtoken')

function example1 () {
    
    const token1 = jsonwt.sign({password: config}, 'secret', {some: 'params'})
}

function example2 () {
    const payload = {one: 1, two: 2, password: "a"}
    
    const token1 = jsonwt.sign(payload, 'secret', {some: 'params'})
}

function example3 () {
    let payload;
    payload = {one: 1, two: 2, password: "a"}
    
    const token1 = jsonwt.sign(payload, 'secret', {some: 'params'})
}

function example4 () {
    const payload = {}
    payload.password = "a"
    
    const token1 = jsonwt.sign(payload, 'secret', {some: 'params'})
}

function example5 () {
    const payload = Object.assign({password: 'bar'}, {bar: 123}, {one: 1, two: 2})
    
    const token1 = jsonwt.sign(payload, 'secret', {some: 'params'})
}

function example6 () {
    let payload;
    payload = Object.assign({password: 'bar'}, {bar: 123}, {one: 1, two: 2})
    
    const token1 = jsonwt.sign(payload, 'secret', {some: 'params'})
}

function example7 () {
    
    const token1 = jsonwt.sign(Object.assign({password: 'bar'}, {bar: 123}, {one: 1, two: 2}), 'secret', {some: 'params'})
}

function example8 () {
    
    const token1 = jsonwt.sign({user: {password: "123"}}, 'secret', {some: 'params'})
}

function example9 () {
    const payload = {one: 1, two: 2, user: {password: "123"}}
    
    const token1 = jsonwt.sign(payload, 'secret', {some: 'params'})
}

function example10 () {
    let payload;
    payload = {one: 1, two: 2, user: {password: "123"}}
    
    const token1 = jsonwt.sign(payload, 'secret', {some: 'params'})
}

function example11 () {
    const payload = {...}
    payload.password = "123"
      
    const token1 = jsonwt.sign(payload, 'secret', {some: 'params'})
}

