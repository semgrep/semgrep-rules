import express from 'express'
import session from 'express-session'
const app = express()
const port = 3000

let a = 'a'
let config = {
  // ruleid: express-session-hardcoded-secret
  secret: 'a',
  resave: false,
  saveUninitialized: false,
}

let config1 = {
  // ok: express-session-hardcoded-secret
  secret: config.secret,
  resave: false,
  saveUninitialized: false,
}


app.use(session({
  // ruleid: express-session-hardcoded-secret
  secret: a,
  resave: false,
  saveUninitialized: false,
}));

app.use(session(config));

app.use(session(config1));

let secret2 = {
  resave: false,
  // ruleid: express-session-hardcoded-secret
  secret: 'foo',
  saveUninitialized: false,
}
app.use(session(secret2));


app.use(session({
  // ok: express-session-hardcoded-secret
  secret: config.secret,
  resave: false,
  saveUninitialized: false,
}));