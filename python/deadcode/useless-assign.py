# ruleid: useless-assignment
x = 5
x = 5

def foo():
    pass

# ruleid: useless-assignment
x = 5
x = 6

def foobar():
    pass

# ruleid: useless-assignment
x = y
x = y()

y() = y()
