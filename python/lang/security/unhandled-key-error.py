import collections
from collections import defaultdict

def bad_cases(d: dict, key: str, data: dict):
    # ruleid:unhandled-key-error
    value = d["c"]

    # ruleid:unhandled-key-error
    value = d[key]

    if "a" in d:
        # ruleid:unhandled-key-error
        value = d["b"]

    try:
        # ruleid:unhandled-key-error
        value = d["c"]
    finally:
        print("Cleanup")
    
    # ruleid:unhandled-key-error
    user_id = data["user"]["id"]

def good_cases(d: dict, dd: defaultdict):
    # ok:unhandled-key-error
    value = d.get("c", 0)

    # ok:unhandled-key-error
    if "c" in d:
        value = d["c"]

    # ok:unhandled-key-error
    if "c" not in d:
        print("key is missing")
    else:
        value = d["c"]

    # ok:unhandled-key-error
    try:
        value = d["c"]
    except KeyError:
        value = 0

    # ok:unhandled-key-error
    d["c"] = 123

    # ok:unhandled-key-error
    del d["c"]

    # ok:unhandled-key-error
    value = dd["c"]
    
    # ok:unhandled-key-error
    dd2 = collections.defaultdict(int)
    value = dd2["c"]
