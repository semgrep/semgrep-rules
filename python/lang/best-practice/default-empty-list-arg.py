# produces unexpected results if y is changed by foo
def foo(x, y = [], z = None):
    y.append(5)
    print(y)

# ok
def bar(x, y = None, z = None):
    if not y:
        y = []
    y.append(5)
    print(y)

foo() # result: [5]
foo() # result: [5, 5]
foo() # result: [5, 5, 5]
