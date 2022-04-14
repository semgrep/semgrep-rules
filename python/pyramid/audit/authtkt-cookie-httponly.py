from pyramid.authentication import AuthTktCookieHelper, AuthTktAuthenticationPolicy


### True positives ###


def bad1():
    # ruleid: pyramid-authtkt-cookie-httponly
    authtkt = AuthTktCookieHelper(secret="test")


def bad2():
    # ruleid: pyramid-authtkt-cookie-httponly
    authtkt = AuthTktCookieHelper(secret="test", httponly=False)


def bad3():
    # ruleid: pyramid-authtkt-cookie-httponly
    authtkt = AuthTktAuthenticationPolicy(secret="test")


def bad4():
    # ruleid: pyramid-authtkt-cookie-httponly
    authtkt = AuthTktAuthenticationPolicy(secret="test", httponly=False)


### True negatives ###


def good1():
    # ok: pyramid-authtkt-cookie-httponly
    authtkt = AuthTktCookieHelper(secret="test", httponly=True)


def good2():
    # ok: pyramid-authtkt-cookie-httponly
    authtkt = AuthTktAuthenticationPolicy(secret="test", httponly=True)
