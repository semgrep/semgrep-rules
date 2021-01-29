# ruleid: useless-literal-dict
d = dict((1, 'a'), (2, 'b'), (1, 'a'))
# ruleid: useless-literal-set
s = set((1, 'a'), (2, 'b'), (1, 'a'))

# ruleid: useless-literal-dict
d = {1: 'a', 2: 'b', 1: 'a'}
# ruleid: useless-literal-dict
d = {'a': 1, 'a': 1}

# ok: useless-literal-dict
d = {1: 'a', 2: 'b', 3: 'a'}
