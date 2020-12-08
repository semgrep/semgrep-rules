function bad_tls1() {
    // ruleid: bypass-tls-verification
    process.env["NODE_TLS_REJECT_UNAUTHORIZED"] = 0;
}

function bad_tls2() {
    // ruleid: bypass-tls-verification
    var req = https.request({
      host: '192.168.1.1',
      port: 443,
      path: '/',
      method: 'GET',
      rejectUnauthorized: false,
      requestCert: true,
      agent: false
    });

    // ruleid: bypass-tls-verification
    var object = {
      host: '192.168.1.1',
      port: 443,
      path: '/',
      method: 'GET',
      rejectUnauthorized: false,
      requestCert: true,
      agent: false
    };

    var req = https.request(object);

    // ruleid: bypass-tls-verification
    var client = new RpcClient({
      user: 'user',
      pass: 'pass',
      host: 'localhost',
      port: 8332,
      rejectUnauthorized: false,
      disableAgent: true
    });
}

// ruleid: bypass-tls-verification
require('request').defaults({method: 'GET', rejectUnauthorized: false, requestCert: true})

var requestvar = require('request');
console.log("hello!");
// ruleid: bypass-tls-verification
requestvar.defaults({method: 'GET', rejectUnauthorized: false, requestCert: true});

function ok_tls1() {
    // ok: bypass-tls-verification
    var req = https.request({
      host: '192.168.1.1',
      port: 443,
      path: '/',
      method: 'GET',
      rejectUnauthorized: true,
      requestCert: true,
      agent: false
    });
}

function ok_tls2() {
    // ok: bypass-tls-verification
    var req = https.request({
      host: '192.168.1.1',
      port: 443,
      path: '/',
      method: 'GET',
      requestCert: true,
      agent: false
    });
}
