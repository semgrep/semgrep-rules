from pyramid.authentication import AuthTktCookieHelper, AuthTktAuthenticationPolicy


### True positives ###


def bad1():
    # ruleid: pyramid-authtkt-cookie-httponly-unsafe-value
    authtkt = AuthTktCookieHelper(secret="test", httponly=False)


def bad2():
    # ruleid: pyramid-authtkt-cookie-httponly-unsafe-value
    authtkt = AuthTktAuthenticationPolicy(secret="test", httponly=False)


### True negatives ###


def good1():
    # ok: pyramid-authtkt-cookie-httponly-unsafe-value
    authtkt = AuthTktCookieHelper(secret="test", httponly=True)


def good2(params):
    # ok: pyramid-authtkt-cookie-httponly-unsafe-value
    authtkt = AuthTktCookieHelper(**params)


def good3():
    # ok: pyramid-authtkt-cookie-httponly-unsafe-value
    authtkt = AuthTktAuthenticationPolicy(secret="test", httponly=True)


def good4(params):
    # ok: pyramid-authtkt-cookie-httponly-unsafe-value
    authtkt = AuthTktAuthenticationPolicy(**params)
