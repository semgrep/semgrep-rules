var serialize = require('serialize-javascript');

function test(userInput) {
// ruleid: unsafe-serialize-javascript
    const result = serialize({foo: userInput}, {unsafe: true, space: 2})
    return result
}

function test2() {
// ruleid: unsafe-serialize-javascript
    const result = serialize({foo: '<img src=x />'}, {unsafe: true, space: 2})
    return result
}

function testOk() {
// ok
    const result = serialize({foo: '<img src=x />'}, {space: 2})
    return result
}