import express from 'express'
import session from 'express-session'
const app = express()
const port = 3000

app.use(session({
  // ruleid: express-session-hardcoded-secret
  secret: 'foo',
  resave: false,
  saveUninitialized: false,
}));

let secret1 = 'foo'
app.use(session({
  // ruleid: express-session-hardcoded-secret
  secret: secret1,
  resave: false,
  saveUninitialized: false,
}));

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