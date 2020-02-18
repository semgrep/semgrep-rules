

# ruleid:useless-comparison
if "detached HEAD" or "master" in expected:
  pass

# todoruleid:useless-comparison
if ("detached HEAD" or "master" in expected):
  pass

# todoruleid:useless-comparison
if ("detached HEAD" and ("master" in expected)):
  pass

# OK
if ("detached HEAD" in expected) and ("master" in expected):
  pass

# ruleid:useless-comparison
if "":
  pass

# ok
if some_id == "foobar":
     pass