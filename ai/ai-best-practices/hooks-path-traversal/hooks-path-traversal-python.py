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
unsafe_path = os.path.realpath(data["file_path"])
# ruleid: hooks-path-traversal-python
f = open(unsafe_path, "r")

data = json.loads(sys.stdin.read())
unsafe_abs = os.path.abspath(data["file_path"])
# ruleid: hooks-path-traversal-python
os.remove(unsafe_abs)

# ok: hooks-path-traversal-python
hardcoded = open("/tmp/known_file.txt", "r")

# ok: hooks-path-traversal-python
data = json.loads(sys.stdin.read())
resolved = os.path.realpath(data["file_path"])
if resolved.startswith("/tmp/hook-workspace"):
    f = open(resolved, "r")

# ok: hooks-path-traversal-python
data = json.loads(sys.stdin.read())
resolved = os.path.abspath(data["file_path"])
if not resolved.startswith("/tmp/hook-workspace"):
    raise ValueError("path escapes hook workspace")
os.remove(resolved)
