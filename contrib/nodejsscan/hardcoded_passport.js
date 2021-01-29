// ruleid: hardcoded_passport_secret
const Strat = require("passport-jwt").Strategy;
console.log("words");
var x = new Strat({ secretOrKey: "secret" });


var passport = require('passport')

module.exports = class Auth {
    constructor(config) {
        this.passport = passport
        // ruleid: hardcoded_passport_secret
        var JwtStrategy = require('passport-jwt').Strategy
        this.jwt_secret = 'HARDCODED-SECRET'

        passport.use(new JwtStrategy({
            secretOrKey: this.jwt_secret
        }, function (payload, done) {
            // auth callback
        }))
    }

    something(req, res, next) {
        // do something
    }

}

var FACEBOOK_APP_ID = require('../../../config').fbAppID;
var URLcallback = require('../../../config').URL;
var passport = require('passport');
// ruleid: hardcoded_passport_secret
var FacebookStrategy = require('passport-facebook').Strategy;
var FACEBOOK_APP_SECRET = "HARDCODED-SECRET";


module.exports = function (req, res) {

    passport.use(new FacebookStrategy({
        clientID: FACEBOOK_APP_ID,
        clientSecret: FACEBOOK_APP_SECRET,
        callbackURL: URLcallback + '/api/auth/facebook/callback'
    },
        function (accessToken, refreshToken, profile, done) {
            // do something
        }
    ));
};


let passport = require('passport');
// ruleid: hardcoded_passport_secret
let JwtStrategy = require('passport-jwt').Strategy;
let ExtractJwt = require('passport-jwt').ExtractJwt;

/**
 *
 * @param {object} options
 * @param {object} options.logger
 * @param {object} options.jwtConfig
 * @returns {object}
 */
module.exports = (options) => {
    let jwtConfig = options.jwtConfig;
    let logger = options.logger;
    let secretz = 'HARDCODED-SECRET';

    this.passportOptions = {
        jwtFromRequest: ExtractJwt.fromHeader(jwtConfig.headerKey),
        secretOrKey: secretz,
        issuer: jwtConfig.issuer,
        audience: jwtConfig.audience
    };
    passport.use(new JwtStrategy(this.passportOptions, (jwt_payload, done) => {
        // do something
    }));
    return passport.authenticate('jwt', { session: false })
};

'use strict';
// ruleid: hardcoded_passport_secret
const FacebookStrategy = require('passport-facebook').Strategy;

exports.init = function (passport, router, config) {

    passport.use(
        new FacebookStrategy(
            {
                clientID: config.appId,
                clientSecret: 'HARDCODED-SECRET',
                callbackURL: config.publicAddress + config.callbackURL,
                enableProof: false,
                passReqToCallback: true,
            },
            function (req, accessToken, refreshToken, profile, done) {
                // do something
            },
        ),
    );
};

var passport = require('passport');

// ruleid: hardcoded_passport_secret
var JwtStrategy = require('passport-jwt').Strategy,
    ExtractJwt = require('passport-jwt').ExtractJwt;

var opts = {}
opts.jwtFromRequest = ExtractJwt.fromAuthHeaderAsBearerToken();
opts.secretOrKey = 'hardcoded-secret';
opts.issuer = 'accounts.examplesoft.com';
opts.audience = 'yoursite.net';
passport.use(new JwtStrategy(opts, function (jwt_payload, done) {
    User.findOnez({ id: jwt_payload.sub }, function (err, user) {
        if (err) {
            return done(err, false);
        }
        if (user) {
            return done(null, user);
        } else {
            return done(null, false);
            // or you could create a new account
        }
    });
}));

// ruleid: hardcoded_passport_secret
var FacebookStrategy = require('passport-facebook').Strategy

passport.use(new FacebookStrategy({
    clientID: FACEBOOK_APP_ID,
    clientSecret: "hardcoded-secret",
    callbackURL: "http://localhost:3000/auth/facebook/callback"
},
    function (accessToken, refreshToken, profile, cb) {
        User.findOrCreate({ facebookId: profile.id }, function (err, user) {
            return cb(err, user);
        });
    }
));

// ruleid: hardcoded_passport_secret
var GoogleStrategy = require('passport-google-oauth2').Strategy;

passport.use(new GoogleStrategy({
    clientID: GOOGLE_CLIENT_ID,
    clientSecret: 'hardcoded-secret',
    callbackURL: "http://yourdormain:3000/auth/google/callback",
    passReqToCallback: true
},
    function (request, accessToken, refreshToken, profile, done) {
        User.findOrCreate({ googleId: profile.id }, function (err, user) {
            return done(err, user);
        });
    }
));

// ruleid: hardcoded_passport_secret
var TwitterStrategy = require('passport-twitter').Strategy;

passport.use(new TwitterStrategy({
    consumerKey: TWITTER_CONSUMER_KEY,
    consumerSecret: "hardcoded-secret",
    callbackURL: "http://127.0.0.1:3000/auth/twitter/callback"
},
    function (token, tokenSecret, profile, cb) {
        User.findOrCreate({ twitterId: profile.id }, function (err, user) {
            return cb(err, user);
        });
    }
));

// ruleid: hardcoded_passport_secret
var GoogleStrategy = require('passport-google-oauth1').Strategy;

passport.use(new GoogleStrategy({
    consumerKey: 'www.example.com',
    consumerSecret: 'hardcoded-secret',
    callbackURL: "http://127.0.0.1:3000/auth/google/callback"
},
    function (token, tokenSecret, profile, cb) {
        User.findOrCreate({ googleId: profile.id }, function (err, user) {
            return cb(err, user);
        });
    }
));

// ruleid: hardcoded_passport_secret
var Auth0Strategy = require('passport-auth0').Strategy;

var strategy = new Auth0Strategy({
    domain: 'your-domain.auth0.com',
    clientID: 'your-client-id',
    clientSecret: 'hardcoded-secret',
    callbackURL: '/callback'
},
    function (accessToken, refreshToken, extraParams, profile, done) {
        return done(null, profile);
    }
);

passport.use(strategy);

// ruleid: hardcoded_passport_secret
var OAuth1Strategy = require('passport-oauth1').Strategy;

passport.use(new OAuth1Strategy({
    requestTokenURL: 'https://www.example.com/oauth/request_token',
    accessTokenURL: 'https://www.example.com/oauth/access_token',
    userAuthorizationURL: 'https://www.example.com/oauth/authorize',
    consumerKey: EXAMPLE_CONSUMER_KEY,
    consumerSecret: "hardcoded-secret",
    callbackURL: "http://127.0.0.1:3000/auth/example/callback",
    signatureMethod: "RSA-SHA1"
},
    function (token, tokenSecret, profile, cb) {
        User.findOrCreate({ exampleId: profile.id }, function (err, user) {
            return cb(err, user);
        });
    }
));

// ruleid: hardcoded_passport_secret
var OAuth2Strategy = require('passport-oauth2').Strategy;

passport.use(new OAuth2Strategy({
    authorizationURL: 'https://www.example.com/oauth2/authorize',
    tokenURL: 'https://www.example.com/oauth2/token',
    clientID: EXAMPLE_CLIENT_ID,
    clientSecret: "hardcoded-secret",
    callbackURL: "http://localhost:3000/auth/example/callback"
},
    function (accessToken, refreshToken, profile, cb) {
        User.findOrCreate({ exampleId: profile.id }, function (err, user) {
            return cb(err, user);
        });
    }
));
