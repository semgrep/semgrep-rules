import jwt

def bad1(secret, payload):
    # ruleid: jwt-python-exposed-data
    encoded = jwt.encode(payload, secret, algorithm='HS256')
    return encoded

def ok(secret_key):
    # ok: jwt-python-exposed-data
    encoded = jwt.encode({'some': 'payload'}, secret_key, algorithm='HS256')
    return encoded
