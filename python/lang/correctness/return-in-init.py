class A:
    def __init__(a, b, c):
        # ruleid:return-in-init
        return A(a, b, c)


class B:
    def __init__(a, b, c):
        # ok:return-in-init
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

class H:
    def __init__(self, x):
        # ok:return-in-init
        return None

class Odd:
    def __init__(self, numbers):
        def is_odd(n):
            # ok:return-in-init
            return n % 2 == 1
        self.numbers = filter(is_odd, numbers)

        # todoruleid:return-in-init
        return self.numbers

class Even:
    def __init__(self):
        class EvenNumber:
            def __init__(self, n):
                self.n = n
                # todoruleid:return-in-init
                return n

            def is_even(self):
                # ok:return-in-init
                return self.n % 2 == 0

        self.number = EvenNumber()

    def not_init(self):
        class EvenNumber:
            def __init__(self, n):
                self.n = n
                # ruleid:return-in-init
                return n

            def is_even(self):
                # ok:return-in-init
                return self.n % 2 == 0

        # ok:return-in-init
        return EvenNumber()
