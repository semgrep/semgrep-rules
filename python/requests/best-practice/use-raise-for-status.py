import requests

# ruleid:always-use-raise-for-status
requests.put("")

requests.put
requests.put("").raise_for_status("")

def f():
    # ruleid:always-use-raise-for-status
    return requests.get("")

def f():
    # ruleid:always-use-raise-for-status
    return requests.post("")

def f():
    # ruleid:always-use-raise-for-status
    return requests.put("")

def f():
    # ruleid:always-use-raise-for-status
    return requests.patch("")

def f():
    # ruleid:always-use-raise-for-status
    return requests.delete("")

def f():
    # ruleid:always-use-raise-for-status
    requests.put("")

def f():
    # ruleid:always-use-raise-for-status
    r = requests.get("")
    return r

def f():
    # ruleid:always-use-raise-for-status
    r = requests.get("")
    r.raise_for_status
    return r

def f():
    r = requests.get("")
    r.raise_for_status()
    # ruleid:always-use-raise-for-status
    r = requests.get("")
    r.raise_for_status
    return r

def f():
    # ruleid:always-use-raise-for-status
    r = requests.get("")
    r.raise_for_status
    r = requests.get("")
    r.raise_for_status()
    return r

def f():
    r = requests.get("")
    r.raise_for_status()
    return r

def f():
    requests.put("").raise_for_status()
