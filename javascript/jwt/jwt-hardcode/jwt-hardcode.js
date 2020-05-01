"use strict";
// ruleid: hardcoded-jwt-secret
const jwt = require('jsonwebtoken');
const Promise = require("bluebird");
const secret = "hardcoded-secret"
class Authentication {
	static sign(obj){
		return jwt.sign(obj, secret, {});
	}

	static authenticate(payload) {
		var token = payload.token;
		let promise = new Promise((resolve, reject) => {
			if (token) {
				jwt.verify(token, secret, function (err, decoded) {
					if (err) {
						reject(err);
					} else {
						 resolve(decoded);
					}
				});
			} else {
				reject(new Error("No token provided"));
			}
		});

		return promise;

	}
}

module.exports = Authentication;
