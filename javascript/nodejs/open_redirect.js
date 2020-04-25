const express = require('express');
const router = express.Router()

router.use((req, res, next) => {
    if (req.method === 'POST') {
        console.log(JSON.stringify(req.session.data, null, 2))
    }
    next()
})

router.post('/sprint18b/frequency', (req, res) => {
    res.redirect('/sprint18b/payment') //GOOD
});

var express = require('express');

var app = express();


app.all(function (req, res) {
    // BAD: a request parameter is incorporated without validation into a URL redirect
    // ruleid: express_open_redirect2
    res.header('Location', req.param("foo"));
});

app.get('/some/path', function (req, res) {
    // BAD: a request parameter is incorporated without validation into a URL redirect
    // ruleid: express_open_redirect
    res.redirect(302, req.param("target"));
});


app.get('/redirect/:user', function (req, res) {
    // ruleid: express_open_redirect
    res.redirect('/' + req.params.user); // BAD - could go to //evil.com
});