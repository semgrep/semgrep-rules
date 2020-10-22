# ruleid:raise-not-base-exception
raise "error here"

# ruleid:raise-not-base-exception
raise 5


class Foobar:
    x = 5


# todoruleid:raise-not-base-exception
raise Foobar()


class Foobar2(BaseException):
    x = 5


# ok:raise-not-base-exception
raise Foobar2()

# ok:raise-not-base-exception
raise Exception()
