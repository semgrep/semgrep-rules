def foo(x, y = [], z = None):
    y.append(5)
    print(y)

foo() # result: [5]
foo() # result: [5, 5]
foo() # result: [5, 5, 5]
