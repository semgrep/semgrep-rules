from pyramid.authentication import AuthTktCookieHelper, AuthTktAuthenticationPolicy


### True positives ###


def bad1():
    # ruleid: pyramid-authtkt-cookie-secure-unsafe-value
    authtkt = AuthTktCookieHelper(secret="test", secure=False)


def bad2():
    # ruleid: pyramid-authtkt-cookie-secure-unsafe-value
    authtkt = AuthTktAuthenticationPolicy(secret="test", secure=False)


### True negatives ###


def good1():
    # ok: pyramid-authtkt-cookie-secure-unsafe-value
    authtkt = AuthTktCookieHelper(secret="test", secure=True)


def good2(params):
    # ok: pyramid-authtkt-cookie-secure-unsafe-value
    authtkt = AuthTktCookieHelper(**params)


def good3():
    # ok: pyramid-authtkt-cookie-secure-unsafe-value
    authtkt = AuthTktAuthenticationPolicy(secret="test", secure=True)


def good4(params):
    # ok: pyramid-authtkt-cookie-secure-unsafe-value
    authtkt = AuthTktAuthenticationPolicy(**params)
