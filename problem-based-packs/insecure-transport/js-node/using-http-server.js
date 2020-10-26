var fs = require('fs');
var http = require('http');
var https = require('https');
var privateKey  = fs.readFileSync('sslcert/server.key', 'utf8');
var certificate = fs.readFileSync('sslcert/server.crt', 'utf8');

var credentials = {key: privateKey, cert: certificate};
var express = require('express');
var app = express();

// ruleid: using-http-server
var httpServer = http.createServer(app);
httpServer.listen(8080);

const http = require('http');
// ruleid: using-http-server
const keepAliveAgent = new http.Agent({ keepAlive: true });
options.agent = keepAliveAgent;
// ruleid: using-http-server
http.request(options, onResponseCallback);

// ok: using-http-server
var httpsServer = https.createServer(app);
httpsServer.listen(8080);

const https = require('https');
// ok: using-http-server
const keepAliveAgent = new https.Agent({ keepAlive: true });
options.agent = keepAliveAgent;
// ok: using-http-server
https.request(options, onResponseCallback);
