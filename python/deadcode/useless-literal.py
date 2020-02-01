# ruleid: useless-literal-dict
d = dict(1: 'a', 2: 'b', 1: 'a')
# ruleid: useless-literal-set
d = set(1: 'a', 2: 'b', 1: 'a')

# ruleid: useless-literal-dict
d = {1: 'a', 2: 'b', 1: 'a'}
# ruleid: useless-literal-dict
d = {'a': 1, 'a': 1}

# OK
d = {1: 'a', 2: 'b', 3: 'a'}
