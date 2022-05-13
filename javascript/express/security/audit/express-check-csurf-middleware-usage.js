var express = require('express')
var cookieParser = require('cookie-parser') //for cookie parsing
var csrf = require('csurf') //csrf module
var bodyParser = require('body-parser') //for body parsing

// setup route middlewares
var csrfProtection = csrf({
    cookie: true
})
var parseForm = bodyParser.urlencoded({
    extended: false
})

// create express app
var app = express()

// parse cookies
app.use(cookieParser())

app.get('/form', csrfProtection, function(req, res) {
    // generate and pass the csrfToken to the view
    res.render('send', {
        csrfToken: req.csrfToken()
    })
})

app.post('/process', parseForm, csrfProtection, function(req, res) {
    res.send('data is being processed')
})

// ruleid: express-check-csurf-usage
app.post('/bad', parseForm, function(req, res) {
    res.send('data is being processed')
})