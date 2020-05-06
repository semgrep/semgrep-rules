# ruleid:unusued-iteration-variable-for
for x in foo:
    yield 1

# ok
for _ in foo:
    yield 1

# ok
for x in foo:
    yield x

# ok
for x, _ in foo:
    yield x