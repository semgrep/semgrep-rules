
# ruleid:useless-eqeq
x == x

def __eq__(self, other):
    # ok:useless-eqeq
    return self == self and self == other

def sure(ofcourse):
    # ok:useless-eqeq
    return 1 == 1

class A:
    def __eq__(self, other):
        # ok:useless-eqeq
        return self == self and self == other


# ok:useless-eqeq
assert(x == x)
# ok:useless-eqeq
assert x == x
# ok:useless-eqeq
assert x == x, "of course"
# ok:useless-eqeq
assertTrue(x ==x)
# ok:useless-eqeq
assertFalse(x == x)

# ruleid:useless-eqeq
print(x != x)
