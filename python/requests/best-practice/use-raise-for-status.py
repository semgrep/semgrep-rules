import requests

# ruleid:use-raise-for-status
requests.put("")

requests.put
requests.put("").raise_for_status("")

def f():
    # ruleid:use-raise-for-status
    return requests.get("")

def f():
    # ruleid:use-raise-for-status
    return requests.post("")

def f():
    # ruleid:use-raise-for-status
    return requests.put("")

def f():
    # ruleid:use-raise-for-status
    return requests.patch("")

def f():
    # ruleid:use-raise-for-status
    return requests.delete("")

def f():
    # ruleid:use-raise-for-status
    requests.put("")

def f():
    # ruleid:use-raise-for-status
    r = requests.get("")
    return r

def f():
    # ruleid:use-raise-for-status
    r = requests.get("")
    r.raise_for_status
    return r

def f():
    # ok:use-raise-for-status
    r = requests.get("")
    r.raise_for_status()
    # ruleid:use-raise-for-status
    r = requests.get("")
    r.raise_for_status
    return r

def f():
    # ruleid:use-raise-for-status
    r = requests.get("")
    r.raise_for_status
    # ok:use-raise-for-status
    r = requests.get("")
    r.raise_for_status()
    return r

def f():
    # ok:use-raise-for-status
    r = requests.get("")
    r.raise_for_status()
    return r

def f():
    # ok:use-raise-for-status
    r = requests.get("")
    if r.status_code != requests.codes.ok:
        logging.error("Something awful happened", r)
    return r

def f():
    # ok:use-raise-for-status
    r = requests.get("")
    if not r.ok:
        logging.error("Something awful happened", r)
    return r

def f():
    # ok:use-raise-for-status
    r = requests.get("")
    if r.ok:
        return r

def f():
    # ok:use-raise-for-status
    requests.put("").raise_for_status()

def f():
    # ok:use-raise-for-status
    from contextlib import nullcontext
    with nullcontext():
        r = requests.post("")
    r.raise_for_status()

def f():
    # ok:use-raise-for-status
    from contextlib import nullcontext
    with nullcontext(value) as value:
        r = requests.post("")
    r.raise_for_status()

def f():
    # ok:use-raise-for-status
    with open("file.txt", mode="r") as f:
        logging.debug("Opened file for uploading.")
        r = requests.post("", files={"file": f})
        logging.debug("Request finished. Closing file before checking status.")
    r.raise_for_status()
