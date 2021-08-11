const https = require('https');

function ok1() {
    const constants = require('crypto');
    // ok: disallow-old-tls-versions1
    https.createServer({
        secureOptions: constants.SSL_OP_NO_TLSv1 | constants.SSL_OP_NO_SSLv3  | constants.SSL_OP_NO_SSLv2
    }, app).listen(443);
}

function ok2() {
    const consts = require('crypto');
    // ok: disallow-old-tls-versions1
    https.createServer({
        secureOptions: consts.SSL_OP_NO_TLSv1 | consts.SSL_OP_NO_SSLv3  | consts.SSL_OP_NO_SSLv2
    }, app).listen(443);
}

function ok3() {
    const consts = require('crypto');
    // ok: disallow-old-tls-versions1
    https.createServer({
        secureOptions: consts.SSL_OP_NO_SSLv3  | consts.SSL_OP_NO_SSLv2 |  consts.SSL_OP_NO_TLSv1
    }, app).listen(443);
}

function ok4() {
    const consts = require('constants');
    // ok: disallow-old-tls-versions1
    https.createServer({
        secureOptions: consts.SSL_OP_NO_SSLv3  | consts.SSL_OP_NO_SSLv2 |  consts.SSL_OP_NO_TLSv1
    }, app).listen(443);
}

function bad1() {
    const consts = require('crypto');
    // ruleid: disallow-old-tls-versions1
    https.createServer({
        secureOptions: consts.SSL_OP_NO_TLSv1 | consts.SSL_OP_NO_SSLv3
    }, app).listen(443);
}

function bad2() {
    const consts = require('crypto');
    // ruleid: disallow-old-tls-versions1
    https.createServer({
        secureOptions: consts.SSL_OP_NO_TLSv1
    }, app).listen(443);
}

function bad3() {
    const consts = require('crypto');
    // ruleid: disallow-old-tls-versions1
    https.createServer({ oops: oops
    }, app).listen(443);
}

function bad4() {
    const consts = require('constants');
    // ruleid: disallow-old-tls-versions1
    https.createServer({ oops: oops
    }, app).listen(443);
}
