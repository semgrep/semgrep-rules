import time as t


def a():
    return 10


# OK:arbitrary-sleep
t.sleep

# ruleid:arbitrary-sleep
t.sleep(5)
# ruleid:arbitrary-sleep
t.sleep(0.1)
# todoruleid:arbitrary-sleep
time.sleep("bad")

# OK:arbitrary-sleep
t.sleep(a())

# ok:arbitrary-sleep
t.sleep(some_var)
