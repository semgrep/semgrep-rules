function verifyJwt() {
    let jwt = require("jsonwebtoken");
    let secret = 'some-secret';
    // ruleid: jwt-none-alg
    jwt.verify('token-here', secret, { algorithms: ['RS256', 'none'] }, function(err, payload) {
        console.log(payload);
    });
}

// ok: jwt-none-alg
const jwt = require("jsonwebtoken");
const secret = 'some-secret';
const payload = jwt.verify('token-here', secret, { algorithms: ['RS256', 'HS256'] });
