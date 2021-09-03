const http = require('http');

function bad_http() {
    // ruleid: http-request
    http.get('http://nodejs.org/dist/index.json', (res) => {
    const { statusCode } = res;})

    // ok: http-request
    https.get('http://nodejs.org/dist/index.json', (res) => {
    const { statusCode } = res;})

    // ruleid: http-request
    const options = {
        port: 80,
        hostname: 'www.google.com',
        path: '/upload'
    }

    const req = http.request(options, (res) => {
    console.log(`STATUS: ${res.statusCode}`);})

    // ok: http-request
    const options = {
        port: 80,
        hostname: 'www.google.com',
        path: '/upload'
    }

    const req = https.request(options, (res) => {
    console.log(`STATUS: ${res.statusCode}`);})

    // ruleid: http-request
    const options = new URL('http://abc:xyz@example.com');

    const req = http.request(options, (res) => {
    });

    // ok: http-request
    const options = new URL('http://abc:xyz@example.com');

    const req = https.request(options, (res) => {
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
