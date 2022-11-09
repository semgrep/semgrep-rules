from pyramid.authentication import AuthTktCookieHelper, AuthTktAuthenticationPolicy


### True positives ###


def bad1():
    # ruleid: pyramid-authtkt-cookie-httponly-unsafe-default
    authtkt = AuthTktCookieHelper(secret="test", httponly=True)


def bad3():
    # ruleid: pyramid-authtkt-cookie-httponly-unsafe-default
    authtkt = AuthTktAuthenticationPolicy(secret="test", httponly=True)


### True negatives ###


def good1():
    # ok: pyramid-authtkt-cookie-httponly-unsafe-default
    authtkt = AuthTktCookieHelper(secret="test", httponly=True)


def good2(params):
    # ok: pyramid-authtkt-cookie-httponly-unsafe-default
    authtkt = AuthTktCookieHelper(**params)


def good3():
    # ok: pyramid-authtkt-cookie-httponly-unsafe-default
    authtkt = AuthTktAuthenticationPolicy(secret="test", httponly=True)


def good4(params):
    # ok: pyramid-authtkt-cookie-httponly-unsafe-default
    authtkt = AuthTktAuthenticationPolicy(**params)
