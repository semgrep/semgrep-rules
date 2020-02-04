class A:

    def __init__(a, b, c):
        # ruleid:return-in-init
        return A(a, b, c)


class B:

    def __init__(a, b, c):
        # ruleid:yield-in-init
        yield

class C:

    def __init__():
        # ruleid:yield-in-init
        yield 5
