def func1():
    # ruleid:open-never-closed
    fd = open('foo')
    x = 123


def func2():
    fd = open('bar')
    fd.close()
