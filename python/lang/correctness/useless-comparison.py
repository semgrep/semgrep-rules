

# ruleid:no-strings-as-booleans
if "detached HEAD" or "master" in expected:
  pass

# ruleid:no-strings-as-booleans
if ("detached HEAD" or "master" in expected):
  pass

# ruleid:no-strings-as-booleans
if ("detached HEAD" and ("master" in expected)):
  pass

# todook:no-strings-as-booleans
if ("detached HEAD" in expected) and ("master" in expected):
  pass

# ruleid:no-strings-as-booleans
if "":
  pass

# todook:no-strings-as-booleans
if some_id == "foobar":
     pass
