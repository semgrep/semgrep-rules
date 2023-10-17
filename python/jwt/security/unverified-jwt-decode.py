# cf. https://github.com/we45/Vulnerable-Flask-App/blob/752ee16087c0bfb79073f68802d907569a1f0df7/app/app.py#L96

import jwt
from jwt.exceptions import DecodeError, MissingRequiredClaimError, InvalidKeyError

def tests(token):
    # ruleid:unverified-jwt-decode
    jwt.decode(encoded, key, options={"verify_signature": False})

    # ruleid:unverified-jwt-decode
    opts = {"verify_signature": False}
    jwt.decode(encoded, key, options=opts)

    a_false_boolean = False
    # ruleid:unverified-jwt-decode
    opts2 = {"verify_signature": a_false_boolean}
    jwt.decode(encoded, key, options=opts2)

    # ok:unverified-jwt-decode
    jwt.decode(encoded, key, options={"verify_signature": True})

    opts = {"verify_signature": True}
    # ok:unverified-jwt-decode
    jwt.decode(encoded, key, options=opts)

    a_false_boolean = True
    opts2 = {"verify_signature": a_false_boolean}
    # ok:unverified-jwt-decode
    jwt.decode(encoded, key, options=opts2)

    # ok:unverified-jwt-decode
    jwt.decode(encoded, key)

