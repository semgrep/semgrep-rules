import json
import sys
import os
import shutil
import pathlib

data = json.loads(sys.stdin.read())
# ruleid: hooks-path-traversal-python
f = open(data["file_path"], "r")

hook_input = json.load(sys.stdin)
# ruleid: hooks-path-traversal-python
os.remove(hook_input["path"])

payload = json.loads(sys.stdin.read())
# ruleid: hooks-path-traversal-python
shutil.copy(payload["source"], "/tmp/dest")

payload = json.loads(sys.stdin.read())
# ruleid: hooks-path-traversal-python
p = pathlib.Path(payload["file"])

data = json.loads(sys.stdin.read())
resolved_only = os.path.realpath(data["file_path"])
# ruleid: hooks-path-traversal-python
f = open(resolved_only, "r")

data = json.loads(sys.stdin.read())
abs_only = os.path.abspath(data["file_path"])
# ruleid: hooks-path-traversal-python
os.remove(abs_only)

data = json.loads(sys.stdin.read())
unchecked = data["name"]
if unchecked.startswith("x"):
    # ruleid: hooks-path-traversal-python
    os.remove(unchecked)

# ok: hooks-path-traversal-python
data = json.loads(sys.stdin.read())
safe_path = os.path.realpath(data["file_path"])
if safe_path.startswith("/allowed/"):
    f = open(safe_path, "r")

# ok: hooks-path-traversal-python
data = json.loads(sys.stdin.read())
base = "/allowed"
target = os.path.realpath(os.path.join(base, data["file"]))
if not target.startswith(base):
    raise ValueError("path escape")
os.remove(target)

# ok: hooks-path-traversal-python
hardcoded = open("/tmp/known_file.txt", "r")
