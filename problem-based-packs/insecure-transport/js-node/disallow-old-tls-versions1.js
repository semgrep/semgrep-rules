function ok1() {
    // ok: disallow-old-tls-versions1
    const constants = require('crypto');
    https.createServer({
        secureOptions: constants.SSL_OP_NO_TLSv1 | constants.SSL_OP_NO_SSLv3  | constants.SSL_OP_NO_SSLv2
    }, app).listen(443);
}

function ok2() {
    // ok: disallow-old-tls-versions1
    const consts = require('crypto');
    https.createServer({
        secureOptions: consts.SSL_OP_NO_TLSv1 | consts.SSL_OP_NO_SSLv3  | consts.SSL_OP_NO_SSLv2
    }, app).listen(443);
}

function ok3() {
    // ok: disallow-old-tls-versions1
    const consts = require('crypto');
    https.createServer({
        secureOptions: consts.SSL_OP_NO_SSLv3  | consts.SSL_OP_NO_SSLv2 |  consts.SSL_OP_NO_TLSv1
    }, app).listen(443);
}

function bad1() {
    // ruleid: disallow-old-tls-versions1
    const consts = require('crypto');
    https.createServer({
        secureOptions: consts.SSL_OP_NO_TLSv1 | consts.SSL_OP_NO_SSLv3
    }, app).listen(443);
}

function bad2() {
    // ruleid: disallow-old-tls-versions1
    const consts = require('crypto');
    https.createServer({
        secureOptions: consts.SSL_OP_NO_TLSv1
    }, app).listen(443);
}

function bad3() {
    // ruleid: disallow-old-tls-versions1
    const consts = require('crypto');
    https.createServer({ oops: oops
    }, app).listen(443);
}
