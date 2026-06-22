const http = require('http');

function bad_http() {
    // ruleid: http-request
    http.get('http://nodejs.org/dist/index.json', (res) => {
    const { statusCode } = res;})

    // ok: http-request
    https.get('http://nodejs.org/dist/index.json', (res) => {
    const { statusCode } = res;})

    // ruleid: http-request
    const options1 = {
        port: 80,
        hostname: 'www.google.com',
        path: '/upload'
    }

    const req1 = http.request(options1, (res) => {
    console.log(`STATUS: ${res.statusCode}`);})

    // ok: http-request
    const options2 = {
        port: 80,
        hostname: 'www.google.com',
        path: '/upload'
    }

    const req2 = https.request(options2, (res) => {
    console.log(`STATUS: ${res.statusCode}`);})

    // ruleid: http-request
    const options3 = new URL('http://abc:xyz@example.com');

    const req3 = http.request(options3, (res) => {
    });

    // ok: http-request
    const options4 = new URL('http://abc:xyz@example.com');

    const req4 = https.request(options4, (res) => {
    });
};

function more_bad_http() {
    console.log("what");
    // ok: http-request
    const req = https.request('http://google.com', options, (res) => {
    });

    // ruleid: http-request
    const req = http.request('http://google.com', options, (res) => {
    });
};

function ok_http() {
    // ok: http-request
    const options = {
        port: 80,
        hostname: 'www.google.com',
        path: '/upload',
        protocol: 'https'
    }

    const req = http.request(options, (res) => {
    console.log(`STATUS: ${res.statusCode}`);})

    // ok: http-request
    const options = {
        port: 80,
        hostname: 'www.google.com',
        path: '/upload',
        protocol: 'https'
    }

    const req = https.request(options, (res) => {
    console.log(`STATUS: ${res.statusCode}`);})
}
