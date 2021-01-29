import jwt

# ruleid: jwt-python-exposed-credentials
payload = {'foo': 'bar','password': 123}

def bad1(secret, value):
    # ruleid: jwt-python-exposed-credentials
    encoded = jwt.encode({'some': 'payload','password': value}, secret, algorithm='HS256')
    return encoded

def bad2(secret):
    encoded = jwt.encode(payload, secret, algorithm='HS256')
    return encoded

def bad3(secret, value):
    # ruleid: jwt-python-exposed-credentials
    pp = {'one': 'two','password': value}
    encoded = jwt.encode(pp, secret, algorithm='HS256')
    return encoded

def ok(secret_key):
    # ok: jwt-python-exposed-credentials
    encoded = jwt.encode({'some': 'payload'}, secret_key, algorithm='HS256')
    return encoded
