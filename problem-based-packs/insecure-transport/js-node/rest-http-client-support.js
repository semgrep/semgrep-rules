var Client = require('node-rest-client').Client;

function bad_http1() {
    var client = new Client();

    // direct way
    // ruleid: rest-http-client-support
    client.get("http://remote.site/rest/xml/method", function (data, response) {
        // parsed response body as js object
        console.log(data);
        // raw response
        console.log(response);
    });
}

// ok: rest-http-client-support
var Client = require('node-rest-client').Client;

function ok_http1() {
    var client = new Client();

    // direct way
    client.get("https://remote.site/rest/xml/method", function (data, response) {
        // parsed response body as js object
        console.log(data);
        // raw response
        console.log(response);
    });
}

var Client = require('node-rest-client').Client;

var client = new Client();

function bad_http2() {
    // set content-type header and data as json in args parameter
    var args = {
        data: { test: "hello" },
        headers: { "Content-Type": "application/json" }
    };

    // ruleid: rest-http-client-support
    client.post("http://remote.site/rest/xml/method", args, function (data, response) {
        // parsed response body as js object
        console.log(data);
        // raw response
        console.log(response);
    });
}

// ok: rest-http-client-support
var Client = require('node-rest-client').Client;

var client = new Client();

function ok_http2() {
    // set content-type header and data as json in args parameter
    var args = {
        data: { test: "hello" },
        headers: { "Content-Type": "application/json" }
    };

    client.post("https://remote.site/rest/xml/method", args, function (data, response) {
        // parsed response body as js object
        console.log(data);
        // raw response
        console.log(response);
    });
}

const axios = require('axios');
function bad_http3() {
    // ruleid: rest-http-client-support
    axios({
    method: 'get',
    url: 'http://bit.ly/2mTM3nY',
    responseType: 'stream'
    })
    .then(function (response) {
        response.data.pipe(fs.createWriteStream('ada_lovelace.jpg'))
    });
}

// ok: rest-http-client-support
const axios = require('axios');
function ok_http3() {
    axios({
    method: 'get',
    url: 'https://bit.ly/2mTM3nY',
    responseType: 'stream'
    })
    .then(function (response) {
        response.data.pipe(fs.createWriteStream('ada_lovelace.jpg'))
    });
}

const axios = require('axios');
function bad_http4() {
    axios.all([
    // ruleid: rest-http-client-support
    axios.get('http://api.github.com/users/mapbox'),
    axios.get('https://api.github.com/users/phantomjs')
    ])
}

// ok: rest-http-client-support
const axios = require('axios');
function ok_http4() {
    axios.all([
    axios.get('https://api.github.com/users/mapbox'),
    axios.get('https://api.github.com/users/phantomjs')
    ])
}

const stream = require('stream');
const {promisify} = require('util');
const fs = require('fs');
const got = require('got');

function bad_http5() {
    const pipeline = promisify(stream.pipeline);

    (async () => {
        await pipeline(
            // ruleid: rest-http-client-support
            got.stream('http://sindresorhus.com'),
            fs.createWriteStream('index.html')
        );

        // For POST, PUT, and PATCH methods `got.stream` returns a `stream.Writable`
        await pipeline(
            fs.createReadStream('index.html'),
            got.stream.post('https://sindresorhus.com')
        );
    })();
}

const stream = require('stream');
const {promisify} = require('util');
const fs = require('fs');
// ok: rest-http-client-support
const got = require('got');

function ok_http5() {
    const pipeline = promisify(stream.pipeline);

    (async () => {
        await pipeline(
            got.stream('https://sindresorhus.com'),
            fs.createWriteStream('index.html')
        );

        // For POST, PUT, and PATCH methods `got.stream` returns a `stream.Writable`
        await pipeline(
            fs.createReadStream('index.html'),
            got.stream.post('https://sindresorhus.com')
        );
    })();
}

const got = require('got');
function bad_http6() {
    // ruleid: rest-http-client-support
    got('http://api.nasa.gov/planetary/apod?api_key=DEMO_KEY', { json: true }).then(response => {
    console.log(response.body.url);
    console.log(response.body.explanation);
    }).catch(error => {
    console.log(error.response.body);
    });
}

// ok: rest-http-client-support
const got = require('got');
function ok_http6() {
    got('https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY', { json: true }).then(response => {
    console.log(response.body.url);
    console.log(response.body.explanation);
    }).catch(error => {
    console.log(error.response.body);
    });
}
