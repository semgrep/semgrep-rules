var jwt = require('express-jwt');
var blacklist = require('express-jwt-blacklist');

// ruleid: jwt_not_revoked
app.get('/ok-protected', jwt({ secret: process.env.SECRET }), function (req, res) {
    if (!req.user.admin) return res.sendStatus(401);
    res.sendStatus(200);
});

let configSecret = config.get('secret')
const opts = Object.assign({ issuer: 'http://issuer' }, { secret: configSecret })
// ruleid: jwt_not_revoked
app.get('/ok-protected', jwt(opts), function (req, res) {
    if (!req.user.admin) return res.sendStatus(401);
    res.sendStatus(200);
});
