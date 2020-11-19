var thenify = require('thenify');

function bad1() {
// ruleid: multiargs-code-execution
    var promise = thenify(function (callback) {
        callback(null, 1, 2, 3);
    }, { multiArgs: [ 'one', 'tow', 'three' ] });
}

function bad2() {
// ruleid: multiargs-code-execution
    var params = { multiArgs: [ 'one', 'tow', 'three' ] };

    var promise = thenify(function (callback) {
        callback(null, 1, 2, 3);
    }, params);
}

function ok1() {
// ok: multiargs-code-execution
    var promise = thenify(function (callback) {
        callback(null, 1, 2, 3);
    }, { multiArgs: false });
}

function ok2() {
// ok: multiargs-code-execution
    var params = { multiArgs: false };

    var promise = thenify(function (callback) {
        callback(null, 1, 2, 3);
    }, params);
}
