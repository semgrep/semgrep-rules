from pyramid.authentication import AuthTktCookieHelper, AuthTktAuthenticationPolicy


### True positives ###


def bad1():
    # ruleid: pyramid-authtkt-cookie-secure
    authtkt = AuthTktCookieHelper(secret="test")


def bad2():
    # ruleid: pyramid-authtkt-cookie-secure
    authtkt = AuthTktCookieHelper(secret="test", secure=False)


def bad3():
    # ruleid: pyramid-authtkt-cookie-secure
    authtkt = AuthTktAuthenticationPolicy(secret="test")


def bad4():
    # ruleid: pyramid-authtkt-cookie-secure
    authtkt = AuthTktAuthenticationPolicy(secret="test", secure=False)


### True negatives ###


def good1():
    # ok: pyramid-authtkt-cookie-secure
    authtkt = AuthTktCookieHelper(secret="test", secure=True)


def good2():
    # ok: pyramid-authtkt-cookie-secure
    authtkt = AuthTktAuthenticationPolicy(secret="test", secure=True)
