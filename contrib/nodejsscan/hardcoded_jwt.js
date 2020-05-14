// ruleid:hardcoded_jwt_secret
const jsonwt = require('jsonwebtoken')
const jose = require('jose')
const { JWK, JWT } = jose
const config = require('./config')

const payload = { foo: 'bar' }
const secret = 'shhhhh'

const secret2 = config.secret
const secret3 = process.env.SECRET || 'fallback-secret'

//jsonwebtoken
//true
const token1 = jsonwt.sign(payload, secret)
//true
const token2 = jsonwt.sign(payload, 'some-secret')

//??
const token5 = jsonwt.sign(payload, secret3)

//jose
//true
const token6 = JWT.sign(payload, JWK.asKey(secret))
//true
const token7 = JWT.sign(payload, JWK.asKey('raz-dva-tri'))
//true
const token8 = JWT.sign(payload, secret)
//true
const token9 = JWT.sign(payload, 'secret-again')



// ruleid:hardcoded_jwt_secret
const $jwt = require('jsonwebtoken');

const cert = 'hardcoded-secret';

module.exports = (app) => {
    app.post('/api/login', (req, res) => {
        app.login(req.body.username, req.body.password).then((out) => {
            out.token = $jwt.sign(out, cert, { expiresIn: '1d' });
            res.send(out);
        }, (err) => {
            console.error(err);
            res.status(400).send(err);
        });
    });
};

// ruleid:hardcoded_jwt_secret
const jwt = require('jsonwebtoken')

const jwtSign = (payload = { id: 1 }) =>
    jwt.sign(payload, 'hardcoded-secret')

const jwtVerify = req => () => new Promise((resolve, reject) => {
    const token = req.headers['x-access-token']
    if (!token) {
        resolve(false)
    }
    jwt.verify(token, 'hardcoded-secret', (err, decoded) => {
        if (err) {
            resolve(false)
        }
        resolve(decoded)
    })
})

export default { jwtSign, jwtVerify }
    (() => {

        'use strict';

        // ruleid:hardcoded_jwt_secret
        let User = require('./user'),
            jwt = require('jsonwebtoken');

        const express = require('express');
        let router = express.Router();

        router.post('/signup', (req, res) => {
            let user = new User({
                name: req.body.name,
                password: req.body.password
            });
            var token = jwt.sign(user, "hardcoded-secret", { expiresIn: 60 * 60 * 10 });
            res.send({ success: true, token: token });
        });

        module.exports = router;
    })();

'use strict';
const config = require('./app.config');
const privateMethods = {
    initialize(USER) {
        // ruleid:hardcoded_jwt_secret
        const router = require('express').Router(),
            jwt = require('jsonwebtoken');
        if (config) {
            router.route('/register').post((req, res) => {
                USER.findOne({}).exec((error, user) => {
                    if (error)
                        return res.status(400).send({ error: error });
                    user.save((error, user) => {
                        if (error) {
                            return res.status(400).send({ error: error });
                        } else {
                            const token = jwt.sign({ id: user._id }, 'hardcoded-secret');
                            return res.status(201).json({ token: token });
                        }
                    });
                });
            });
        }
    }
};
module.exports = privateMethods;