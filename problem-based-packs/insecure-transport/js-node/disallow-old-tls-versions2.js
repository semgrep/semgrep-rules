const https = require('https');

function ok1() {
    var constants = require('crypto');
    // ok: disallow-old-tls-versions2
    var sslOptions = {
    key: fs.readFileSync('/etc/ssl/private/private.key'),
    secureProtocol: 'SSLv23_server_method',
    secureOptions: constants.SSL_OP_NO_SSLv2 | constants.SSL_OP_NO_TLSv1 | constants.SSL_OP_NO_SSLv3
    };
    https.createServer(sslOptions);
}

function ok2() {
    var constants = require('crypto');
    // ok: disallow-old-tls-versions2
    var sslOptions = {
    key: fs.readFileSync('/etc/ssl/private/private.key'),
    secureProtocol: 'SSLv23_server_method',
    secureOptions: constants.SSL_OP_NO_SSLv2 | constants.SSL_OP_NO_SSLv3 | constants.SSL_OP_NO_TLSv1
    };
    https.createServer(sslOptions);
}

function ok3() {
    var constants = require('crypto');
    // ok: disallow-old-tls-versions2
    var sslOptions = {
    key: fs.readFileSync('/etc/ssl/private/private.key'),
    secureProtocol: 'SSLv23_server_method',
    secureOptions: constants.SSL_OP_NO_TLSv1 | constants.SSL_OP_NO_SSLv2 | constants.SSL_OP_NO_SSLv3
    };
    https.createServer(sslOptions);
}

function ok4() {
    var constants = require('constants');
    // ok: disallow-old-tls-versions2
    var sslOptions = {
    key: fs.readFileSync('/etc/ssl/private/private.key'),
    secureProtocol: 'SSLv23_server_method',
    secureOptions: constants.SSL_OP_NO_TLSv1 | constants.SSL_OP_NO_SSLv2 | constants.SSL_OP_NO_SSLv3
    };
    https.createServer(sslOptions);
}

function bad1() {
    var constants = require('crypto');
    // ruleid: disallow-old-tls-versions2
    var sslOptions = {
    key: fs.readFileSync('/etc/ssl/private/private.key'),
    secureProtocol: 'SSLv23_server_method',
    secureOptions: constants.SSL_OP_NO_SSLv2 | constants.SSL_OP_NO_SSLv3
    };
    https.createServer(sslOptions);
}

function bad2() {
    var constants = require('crypto');
    // ruleid: disallow-old-tls-versions2
    var sslOptions = {
    key: fs.readFileSync('/etc/ssl/private/private.key'),
    secureProtocol: 'SSLv23_server_method',
    secureOptions: constants.SSL_OP_NO_SSLv2
    };
    https.createServer(sslOptions);
}

function bad3() {
    var constants = require('crypto');
    // ruleid: disallow-old-tls-versions2
    var sslOptions = {
    key: fs.readFileSync('/etc/ssl/private/private.key'),
    secureProtocol: 'SSLv23_server_method',
    };
    https.createServer(sslOptions);
}

function bad4() {
    var constants = require('constants');
    // ruleid: disallow-old-tls-versions2
    var sslOptions = {
    key: fs.readFileSync('/etc/ssl/private/private.key'),
    secureProtocol: 'SSLv23_server_method',
    };
    https.createServer(sslOptions);
}
