# ruleid:pass-body-range
for i in range(100):
    pass

# ruleid:pass-body-fn
def foo():
    pass

def __init__(self):
    # ok:pass-body-fn
    pass

def __init__(self, other):
    # ok:pass-body-fn
    pass

class foo:
    def somemethod():
        # ok:pass-body-fn
        pass


class foobar:
    def someothermethod():
        # ruleid:pass-body-range
        for i in range(100):
            pass
