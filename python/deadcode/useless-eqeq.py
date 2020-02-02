
# ruleid:eqeq-is-bad
x == x

def __eq__(self, other):
    # OK; skip most things that are inside eqs based on what we saw on platform 
    return self == self and self == other

def sure(ofcourse):
    return 1 == 1

# TODO
#class A:
#    def __eq__(self, other):
#        # OK; skip most things that are inside eqs based on what we saw on platform 
#        return self == self and self == other


assertTrue(x ==x)
assertFalse(x == x)

# ruleid:eqeq-is-bad
print(x != x)
