function test1(input) {
    // ruleid: expat-xxe
    var expat = require('node-expat')
    var parser = new expat.Parser('UTF-8')
    parser.parse(input)
}

function test2(input) {
    // ruleid: expat-xxe
    const {Parser} = require('node-expat')
    const parser = new Parser('UTF-8')
    parser.write(input)
}

function okTest3() {
    // ok: expat-xxe
    var expat = require('node-expat')
    var parser = new expat.Parser('UTF-8')
    parser.parse("safe input")
}

function okTest4() {
    // ok: expat-xxe
    const {Parser} = require('node-expat')
    const parser = new Parser('UTF-8')
    const x = "safe input"
    parser.write(x)
}

function okTest5(input) {
    // ok: expat-xxe
    const {Parser} = require('some-other-module')
    const parser = new Parser('UTF-8')
    parser.write(input)
}

// ruleid: expat-xxe
import * as expat from 'node-expat'

function test6(input) {
    const parser = new expat.Parser('UTF-8')
    parser.parse(input)
}

// ruleid: expat-xxe
import { Parser } from 'node-expat'

function test7(input) {
    const parser = new Parser('UTF-8')
    parser.write(input)
}
