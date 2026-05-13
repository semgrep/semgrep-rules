import json
import sys
import os
import shutil

data = json.loads(sys.stdin.read())
# ruleid: hooks-sensitive-file-access-python
f = open(data["file_path"], "r")

hook_input = json.load(sys.stdin)
# ruleid: hooks-sensitive-file-access-python
os.remove(hook_input["path"])

payload = json.loads(sys.stdin.read())
# ruleid: hooks-sensitive-file-access-python
shutil.copy(payload["source"], "/tmp/dest")

payload = json.loads(sys.stdin.read())
# ruleid: hooks-sensitive-file-access-python
shutil.move(payload["file"], "/tmp/moved")

# ok: hooks-sensitive-file-access-python
data = json.loads(sys.stdin.read())
path = validate_path(data["file_path"])
f = open(path, "r")

# ok: hooks-sensitive-file-access-python
data = json.loads(sys.stdin.read())
safe_path = os.path.realpath(data["file_path"])
f = open(safe_path, "r")

# ok: hooks-sensitive-file-access-python
hardcoded = open("/tmp/known_file.txt", "r")
