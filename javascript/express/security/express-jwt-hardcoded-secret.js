var jwt = require('express-jwt');

// ruleid: express-jwt-hardcoded-secret
app.get('/protected', jwt({ secret: 'shhhhhhared-secret' }), function(req, res) {
    if (!req.user.admin) return res.sendStatus(401);
    res.sendStatus(200);
});

// ruleid: express-jwt-hardcoded-secret
let hardcodedSecret = 'shhhhhhared-secret'

app.get('/protected2', jwt({ secret: hardcodedSecret }), function(req, res) {
    
    if (!req.user.admin) return res.sendStatus(401);
    res.sendStatus(200);
});

let secret = "hardcode"

const opts = Object.assign({issuer: 'http://issuer'}, {secret: secret})

app.get('/protected3', jwt(opts), function(req, res) {
    if (!req.user.admin) return res.sendStatus(401);
    res.sendStatus(200);
});

// ok: express-jwt-hardcoded-secret
app.get('/ok-protected', jwt({ secret: process.env.SECRET }), function(req, res) {
    if (!req.user.admin) return res.sendStatus(401);
    res.sendStatus(200);
});


let configSecret = config.get('secret')
const opts = Object.assign({issuer: 'http://issuer'}, {secret: configSecret})

// ok: express-jwt-hardcoded-secret
app.get('/ok-protected', jwt(opts), function(req, res) {
    if (!req.user.admin) return res.sendStatus(401);
    res.sendStatus(200);
});
