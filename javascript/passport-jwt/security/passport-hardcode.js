'use strict';
const FacebookStrategy = require('passport-facebook').Strategy;

exports.init = function(passport, router, config) {
  //ok: hardcoded-passport-secret
  new FacebookStrategy({clientSecret:config})
  passport.use(
    new FacebookStrategy(
    // ruleid: hardcoded-passport-secret
      {
        clientID: config.appId,
        clientSecret: 'HARDCODED-SECRET',
        callbackURL: config.publicAddress + config.callbackURL,
        enableProof: false,
        passReqToCallback: true,
      },
      function(req, accessToken, refreshToken, profile, done) {
        // do something
      },
    ),
  );
};

let passport = require('passport');
let JwtStrategy = require('passport-jwt').Strategy;
let ExtractJwt = require('passport-jwt').ExtractJwt;

/**
 *
 * @param {object} options
 * @param {object} options.logger
 * @param {object} options.jwtConfig
 * @returns {object}
 */
module.exports = (options)=> {
    let jwtConfig = options.jwtConfig;
    let logger = options.logger;
    let secret = 'HARDCODED-SECRET';

    this.passportOptions = {
        jwtFromRequest: ExtractJwt.fromHeader(jwtConfig.headerKey),
        secretOrKey: secret,
        issuer: jwtConfig.issuer,
        audience: jwtConfig.audience
    };
    // ruleid: hardcoded-passport-secret
    passport.use(new JwtStrategy(this.passportOptions, (jwt_payload, done)=> {
        // do something
    }));
    return passport.authenticate('jwt', {session: false})
};


var FACEBOOK_APP_ID     = require('../../../config').fbAppID;
var URLcallback         = require('../../../config').URL;
var passport            = require('passport');
var FacebookStrategy    = require('passport-facebook').Strategy;
var FACEBOOK_APP_SECRET = "HARDCODED-SECRET";


module.exports = function(req, res) {

  passport.use(new FacebookStrategy(
     // ruleid: hardcoded-passport-secret 
      {
      clientID:     FACEBOOK_APP_ID,
      clientSecret: FACEBOOK_APP_SECRET,
      callbackURL:  URLcallback + '/api/auth/facebook/callback'
    },
    function(accessToken, refreshToken, profile, done) {
      // do something
    }
  ));
};

var passport = require('passport')

module.exports = class Auth {
  constructor (config) {
    this.passport = passport

    var JwtStrategy = require('passport-jwt').Strategy
    this.jwt_secret = 'HARDCODED-SECRET'

    let obj1 = {}
    obj1.clientSecret = 'a'
    // ruleid: hardcoded-passport-secret     
    new JwtStrategy(obj1)
    // ok: hardcoded-passport-secret     
    new JwtStrategy(obj2)
    // ruleid: hardcoded-passport-secret      
    passport.use(new JwtStrategy({secretOrKey: this.jwt_secret}, function (payload, done) {
      // auth callback
    }))
  }

  something (req, res, next) {
    // do something
  }

}


