const serveIndex = require('serve-index');
var express = require('express')
var app = express()

// ruleid: express-check-directory-listing
app.use('/ftp', serveIndexMiddleware, serveIndex('ftp', { icons: true }));

// ruleid: express-check-directory-listing
app.use('/ftp', serveIndex('ftp', { icons: true }));

// ok: express-check-directory-listing
app.use(bodyParser.text({ type: '*/*' }));
