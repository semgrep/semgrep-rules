const config = require('./config')
const { JWT } = require('jose')

function example(user) {
    // ruleid: jwt_exposed_data
    const token = JWT.sign(user, secret)
    return token;
}
