# cf. https://github.com/we45/Vulnerable-Flask-App/blob/752ee16087c0bfb79073f68802d907569a1f0df7/app/app.py#L96

import jwt
from jwt.exceptions import DecodeError, MissingRequiredClaimError, InvalidKeyError

def tests(token):
    # ruleid:unverified-jwt-decode
    jwt.decode(encoded, key, options={"verify_signature": True})

    # ruleid:unverified-jwt-decode
    opts = {"verify_signature": True}
    jwt.decode(encoded, key, options=opts)

    a_false_boolean = False
    # ruleid:unverified-jwt-decode
    opts2 = {"verify_signature": True}
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



def complete_decode_tests(encoded, key):
    # ruleid:unverified-jwt-decode
    jwt.decode_complete(encoded, key, options={"verify_signature": True})

    # ruleid:unverified-jwt-decode
    options = {"verify_signature": True, "verify_exp": True}
    jwt.decode_complete(encoded, key, options=options)

    # ok:unverified-jwt-decode
    jwt.decode_complete(encoded, key, options={"verify_signature": True})

    # ok:unverified-jwt-decode
    jwt.decode_complete(encoded, key)

    # ok:unverified-jwt-decode
    jwt.decode_complete(encoded, key, options={"verify_exp": False})

    # ok:unverified-jwt-decode
    jwt.decode_other(encoded, key, options={"verify_signature": False})


def imported_complete_decode_test(encoded, key):
    from jwt import decode_complete

    # ruleid:unverified-jwt-decode
    decode_complete(encoded, key, options={"verify_signature": True})
