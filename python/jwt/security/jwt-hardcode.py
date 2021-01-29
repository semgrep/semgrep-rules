import jwt

# ruleid: jwt-python-hardcoded-secret
secret_const = "this-is-secret"

def bad1():
    # ruleid: jwt-python-hardcoded-secret
    encoded = jwt.encode({'some': 'payload'}, 'secret', algorithm='HS256')
    return encoded

def bad2():
    # ruleid: jwt-python-hardcoded-secret
    encoded = jwt.encode({'some': 'payload'}, secret_const, algorithm='HS256')
    return encoded

def bad3():
    # ruleid: jwt-python-hardcoded-secret
    secret = 'secret'
    # ruleid: jwt-python-hardcoded-secret
    encoded = jwt.encode({'some': 'payload'}, secret, algorithm='HS256')
    return encoded

def ok(secret_key):
    encoded = jwt.encode({'some': 'payload'}, secret_key, algorithm='HS256')
    return encoded
