# ok:hardcoded-password-default-argument
password = "this-is-probably-a-test"

def say_something(something):
    print(something)

# ok:hardcoded-password-default-argument
say_something(password)

# ok:hardcoded-password-default-argument
def say_something_else(something_else="something else"):
    print(something_else)

# ruleid:hardcoded-password-default-argument
def whoops(password="this-could-be-bad"):
    print(password)

# ok:hardcoded-password-default-argument
def ok(password=None):
    print(password)
