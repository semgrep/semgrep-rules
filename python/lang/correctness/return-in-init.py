class A:
    def __init__(a, b, c):
        # ruleid:return-in-init
        return A(a, b, c)


class B:
    def __init__(a, b, c):
        # ruleid:return-in-init
        return


class C:
    def __init__(a, b, c):
        # ruleid:yield-in-init
        yield


class D:
    def __init__():
        # ruleid:yield-in-init
        yield 5


def __init__(a, b, c):
    # ok:yield-in-init
    return A(a, b, c)


def __init__(a, b, c):
    # ok:yield-in-init
    yield


def __init__():
    # ok:yield-in-init
    yield 5


class E:
    def func1():
        if not hello:
            # ok:yield-in-init
            yield 5
        # ok:yield-in-init
        yield other


class F:
    def __init__():
        pass

    def func1():
        # ok:return-in-init
        return 5

    def func2():
        # ok:return-in-init
        return


class G:
    def __init__():
        pass

    def func1():
        # ok:yield-in-init
        yield 5

    def func2():
        # ok:yield-in-init
        yield
