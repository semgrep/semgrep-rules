import express from 'express';
import Ajv from 'ajv';

function test1() {
    const settings = { allErrors: true, smth: 'else' }
    // ruleid: ajv-allerrors-true
    const ajv1 = new Ajv(settings);
    return ajv1
}

function test2() {
    // ruleid: ajv-allerrors-true
    var ajv = new Ajv({ allErrors: true, smth: 'else' });
    ajv.addSchema(schema, 'input');
}

function okTest1() {
    // ok: ajv-allerrors-true
    let ajv = new Ajv({ allErrors: process.env.DEBUG });
    ajv.addSchema(schema, 'input');
}
