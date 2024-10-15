# ruleid: check-is-none-explicitly
if record and record == 0:
    print("hello, this will never happen")

# ok: check-is-none-explicitly
if record is not None and record == 0:
    print("this is fine")

# ruleid: check-is-none-explicitly
if record.a and record.a == 0:
    print("Not reachable")

# ruleid: check-is-none-explicitly
if record.a.get("H") and record.a["H"] == 0:
    print("Not reachable")

# ok: check-is-none-explicitly
if record.a.get("I") and record.a["J"] == 0:
    print("This is also fine")