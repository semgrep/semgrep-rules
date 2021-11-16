const jwt = require('jsonwebtoken');

function notOk(token) {
  // ruleid: jwt-decode-without-verify
  if (jwt.decode(token, true).param === true) {
    console.log('token is valid');
  }
}

function ok(token, key) {
  // ok: jwt-decode-without-verify
  jwt.verify(token, key);
  if (jwt.decode(token, true).param === true) {
    console.log('token is valid');
  }
}

const ok2 = (token, key) => {
  // ok: jwt-decode-without-verify
  const value = jwt.decode(token, key).param;
  if (jwt.verify(token, true).param === true) {
    console.log('token is valid');
  }
};
