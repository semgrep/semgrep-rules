// example from https://hackerone.com/reports/748214
const jwt = require('jsonwebtoken');

module.exports = function (sequelize) {
  const OauthAccessToken = require('./OauthAccessToken')(sequelize);

  return async function passport_middleware(request, response, next) {
    const { headers } = request;
    if (headers.authorization) {
      const authorization = headers.authorization;
      const comp = authorization.split(' ');
      if (comp.length == 2 && comp[0] == 'Bearer') {
        const token = comp[1];
        // ruleid: jwt-decode-without-verify
        const { jti } = jwt.decode(token);

        const access_token = await OauthAccessToken.findById(jti);
        request.user_id = access_token.user_id
      }
    }
    next();
  }
}
