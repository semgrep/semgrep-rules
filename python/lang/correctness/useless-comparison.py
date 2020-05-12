

# ruleid:useless-comparison
if "detached HEAD" or "master" in expected:
  pass

# ruleid:useless-comparison
if ("detached HEAD" or "master" in expected):
  pass

# ruleid:useless-comparison
if ("detached HEAD" and ("master" in expected)):
  pass

# todook
if ("detached HEAD" in expected) and ("master" in expected):
  pass

# ruleid:useless-comparison
if "":
  pass

# todook
if some_id == "foobar":
     pass
