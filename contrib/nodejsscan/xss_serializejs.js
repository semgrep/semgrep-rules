var serialize = require('serialize-javascript');

function test(userInput) {
    // ruleid: xss_serialize_javascript
    const result = serialize({ foo: userInput }, { unsafe: true, space: 2 })
    return result
}

function test2() {
    // ruleid: xss_serialize_javascript
    const result = serialize({ foo: '<img src=x />' }, { unsafe: true, space: 2 })
    return result
}
