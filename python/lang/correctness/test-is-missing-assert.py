
import unittest

class TestSomething(unittest.TestCase):
    def test_something(self):
        # ruleid: test-is-missing-assert
        a == b

        # ruleid: test-is-missing-assert
        a == b, "message"

        # ok: test-is-missing-assert
        assert a == b, "message"

        # ok: test-is-missing-assert
        1 == 1 and print("hello world")

        # ok: test-is-missing-assert
        a = (1 == 1, "hello world")

        # ok: test-is-missing-assert
        print(1 == 1, "hello world")

        # ok: test-is-missing-assert
        a[1 == 1] = 1

        # ok: test-is-missing-assert
        while a == b:
            pass

        # ok: test-is-missing-assert
        a += b == 'b'

        # ok: test-is-missing-assert
        a = 3 if a == b else 4

        # ok: test-is-missing-assert
        yield a == b

        # ok: test-is-missing-assert
        a |= b == c

        # ok: test-is-missing-assert
        a &= b == c
