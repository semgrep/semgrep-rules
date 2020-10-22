import jwt

def bad1():
    # ruleid: jwt-python-none-alg
    encoded = jwt.encode({'some': 'payload'}, None, algorithm='none')
    return encoded

def bad2(encoded):
    # ruleid: jwt-python-none-alg
    jwt.decode(encoded, None, algorithms=['none'])
    return encoded

def ok(secret_key):
    # ok: jwt-python-none-alg
    encoded = jwt.encode({'some': 'payload'}, secret_key, algorithm='HS256')
    return encoded
