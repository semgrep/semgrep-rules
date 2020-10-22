x = object()

# ruleid:identical-is-comparison
if x is x:
  print('true')

if x is None: # ok:identical-is-comparison
  pass

if (type(X) is str):
  pass # ok:identical-is-comparison

if x is True:
  pass # ok:identical-is-comparison

if x is False:
  pass # ok:identical-is-comparison

# ruleid: string-is-comparison
if x is 'hello there':
  pass

# ruleid: string-is-comparison
if "hello there" is x:
  pass

# Ook: string-is-comparison
if x is '':
  pass
