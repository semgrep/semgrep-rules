def func1():
    # ruleid:open-never-closed
    fd = open('foo')
    x = 123


def func2():
    # ok:open-never-closed
    fd = open('bar')
    fd.close()

def func3():
    # ok:open-never-closed
    fd = open('baz')
    try:
        pass
    finally:
        fd.close()
