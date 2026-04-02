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

# ok: hooks-path-traversal-python
data = json.loads(sys.stdin.read())
safe_path = os.path.realpath(data["file_path"])
f = open(safe_path, "r")

# ok: hooks-path-traversal-python
data = json.loads(sys.stdin.read())
abs_path = os.path.abspath(data["file_path"])
os.remove(abs_path)

# ok: hooks-path-traversal-python
hardcoded = open("/tmp/known_file.txt", "r")
