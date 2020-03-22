var passport = require('passport');

// http://www.passportjs.org/packages/passport-jwt/
var JwtStrategy = require('passport-jwt').Strategy,
    ExtractJwt = require('passport-jwt').ExtractJwt;

var opts = {}
opts.jwtFromRequest = ExtractJwt.fromAuthHeaderAsBearerToken();
opts.secretOrKey = 'hardcoded-secret';
opts.issuer = 'accounts.examplesoft.com';
opts.audience = 'yoursite.net';
passport.use(new JwtStrategy(opts, function(jwt_payload, done) {
    User.findOne({id: jwt_payload.sub}, function(err, user) {
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

// passport-facebook
var FacebookStrategy = require('passport-facebook').Strategy

passport.use(new FacebookStrategy({
    clientID: FACEBOOK_APP_ID,
    clientSecret: "hardcoded-secret",
    callbackURL: "http://localhost:3000/auth/facebook/callback"
  },
  function(accessToken, refreshToken, profile, cb) {
    User.findOrCreate({ facebookId: profile.id }, function (err, user) {
      return cb(err, user);
    });
  }
));

// passport-google-oauth2
var GoogleStrategy = require( 'passport-google-oauth2' ).Strategy;

passport.use(new GoogleStrategy({
    clientID:     GOOGLE_CLIENT_ID,
    clientSecret: 'hardcoded-secret',
    callbackURL: "http://yourdormain:3000/auth/google/callback",
    passReqToCallback   : true
  },
  function(request, accessToken, refreshToken, profile, done) {
    User.findOrCreate({ googleId: profile.id }, function (err, user) {
      return done(err, user);
    });
  }
));

// passport-twitter
var TwitterStrategy = require( 'passport-twitter' ).Strategy;

passport.use(new TwitterStrategy({
    consumerKey: TWITTER_CONSUMER_KEY,
    consumerSecret: "hardcoded-secret",
    callbackURL: "http://127.0.0.1:3000/auth/twitter/callback"
  },
  function(token, tokenSecret, profile, cb) {
    User.findOrCreate({ twitterId: profile.id }, function (err, user) {
      return cb(err, user);
    });
  }
));

// passport-google-oauth1
var GoogleStrategy = require( 'passport-google-oauth1' ).Strategy;

passport.use(new GoogleStrategy({
    consumerKey: 'www.example.com',
    consumerSecret: 'hardcoded-secret',
    callbackURL: "http://127.0.0.1:3000/auth/google/callback"
  },
  function(token, tokenSecret, profile, cb) {
    User.findOrCreate({ googleId: profile.id }, function (err, user) {
      return cb(err, user);
    });
  }
));

// passport-auth0
var Auth0Strategy = require('passport-auth0');

var strategy = new Auth0Strategy({
   domain:       'your-domain.auth0.com',
   clientID:     'your-client-id',
   clientSecret: 'hardcoded-secret',
   callbackURL:  '/callback'
  },
  function(accessToken, refreshToken, extraParams, profile, done) {
    return done(null, profile);
  }
);

passport.use(strategy);

// passport-oauth1
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
  function(token, tokenSecret, profile, cb) {
    User.findOrCreate({ exampleId: profile.id }, function (err, user) {
      return cb(err, user);
    });
  }
));

// passport-oauth2
var OAuth2Strategy = require('passport-oauth2').Strategy;

passport.use(new OAuth2Strategy({
    authorizationURL: 'https://www.example.com/oauth2/authorize',
    tokenURL: 'https://www.example.com/oauth2/token',
    clientID: EXAMPLE_CLIENT_ID,
    clientSecret: "hardcoded-secret",
    callbackURL: "http://localhost:3000/auth/example/callback"
  },
  function(accessToken, refreshToken, profile, cb) {
    User.findOrCreate({ exampleId: profile.id }, function (err, user) {
      return cb(err, user);
    });
  }
));