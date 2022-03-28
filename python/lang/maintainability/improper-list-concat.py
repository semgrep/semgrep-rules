x = False
# ruleid: improper-list-concat
['a', 'b', 'c'] + ['d'] if x else []

x = 1234
# ruleid: improper-list-concat
['a', 'b', 'c'] + ['d'] if x > 1000 else ['e']

# ok: improper-list-concat
['a', 'b', 'c'] + (['d'] if x > 1000 else ['e'])
