from pyramid.authentication import AuthTktCookieHelper, AuthTktAuthenticationPolicy


### True positives ###


def bad1():
    # ruleid: pyramid-authtkt-cookie-secure-unsafe-default
    authtkt = AuthTktCookieHelper(secret="test")


def bad2():
    # ruleid: pyramid-authtkt-cookie-secure-unsafe-default
    authtkt = AuthTktAuthenticationPolicy(secret="test")


### True negatives ###


def good1():
    # ok: pyramid-authtkt-cookie-secure-unsafe-default
    authtkt = AuthTktCookieHelper(secret="test", secure=True)


def good2(params):
    # ok: pyramid-authtkt-cookie-secure-unsafe-default
    authtkt = AuthTktCookieHelper(**params)


def good3():
    # ok: pyramid-authtkt-cookie-secure-unsafe-default
    authtkt = AuthTktAuthenticationPolicy(secret="test", secure=True)


def good4(params):
    # ok: pyramid-authtkt-cookie-secure-unsafe-default
    authtkt = AuthTktAuthenticationPolicy(**params)
