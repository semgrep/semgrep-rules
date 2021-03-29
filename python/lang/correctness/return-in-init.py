class A:
    # ruleid:return-in-init
    def __init__(a, b, c):
        return A(a, b, c)


class B:
    # ruleid:return-in-init
    def __init__(a, b, c):
        return

class C:
    # ok:return-in-init
    def __init__():
        x = 1
    def foo():
        return 4

class D:
    # ruleid:yield-in-init
    def __init__(a, b, c):
        yield


class E:
    # ruleid:yield-in-init
    def __init__():
        yield 5


# ok:yield-in-init
def __init__(a, b, c):
    return A(a, b, c)


# ok:yield-in-init
def __init__(a, b, c):
    yield


# ok:yield-in-init
def __init__():
    yield 5


class E:
    def func1():
        # ok:yield-in-init
        if not hello:
            yield 5
        # ok:yield-in-init
        yield other

class F:
    # ok:yield-in-init
    def __init__():
        x = 1
    def func1():
        yield
