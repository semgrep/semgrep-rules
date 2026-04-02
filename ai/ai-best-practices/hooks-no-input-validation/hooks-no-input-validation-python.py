import json
import sys

# ruleid: hooks-no-input-validation-python
data = json.loads(sys.stdin.read())

# ruleid: hooks-no-input-validation-python
data = json.load(sys.stdin)

# ok: hooks-no-input-validation-python
try:
    data = json.loads(sys.stdin.read())
except (json.JSONDecodeError, ValueError):
    sys.exit(1)

# ok: hooks-no-input-validation-python
try:
    data = json.load(sys.stdin)
except Exception as e:
    print(f"Error: {e}")
    sys.exit(1)
