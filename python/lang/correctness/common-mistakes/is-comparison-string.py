x = object()

# ruleid:identical-is-comparison
if x is x:
  print('true')

# ok:identical-is-comparison
if x is None:
  pass

# ok:identical-is-comparison
if (type(X) is str):
  pass

# ok:identical-is-comparison
if x is True:
  pass

# ok:identical-is-comparison
if x is False:
  pass

# ruleid: string-is-comparison
if x is 'hello there':
  pass

# ruleid: string-is-comparison
if "hello there" is x:
  pass

# ok: string-is-comparison
if x is '':
  pass
