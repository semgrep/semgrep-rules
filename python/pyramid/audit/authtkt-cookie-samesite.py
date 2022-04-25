from pyramid.authentication import AuthTktCookieHelper, AuthTktAuthenticationPolicy


### True positives ###


def bad1():
    # ruleid: pyramid-authtkt-cookie-samesite
    authtkt = AuthTktCookieHelper(secret="test", samesite=None)


def bad2():
    # ruleid: pyramid-authtkt-cookie-samesite
    authtkt = AuthTktAuthenticationPolicy(secret="test", samesite=None)


### True negatives ###


def good1():
    # ok: pyramid-authtkt-cookie-samesite
    authtkt = AuthTktCookieHelper(secret="test")


def good2():
    # ok: pyramid-authtkt-cookie-samesite
    authtkt = AuthTktCookieHelper(secret="test", samesite='Lax')


def good3():
    # ok: pyramid-authtkt-cookie-samesite
    authtkt = AuthTktAuthenticationPolicy(secret="test")


def good4():
    # ok: pyramid-authtkt-cookie-samesite
    authtkt = AuthTktAuthenticationPolicy(secret="test", samesite='Lax')
