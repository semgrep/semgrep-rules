# ruleid:string-concat-in-list
bad = ["123" "456" "789"]

# ruleid:string-concat-in-list
bad = ["123" f"{456}" "789"]

bad = [
    # ruleid:string-concat-in-list
    "abc"
    "cde"
    "efg",
    "hijk"
]

bad = [
    "abc",
    # ruleid:string-concat-in-list
    "cde"
    "efg"
    "hijk"
]

bad = [
    "abc",
    # ruleid:string-concat-in-list
    "cde"
    f"efg"
    "hijk"
]

bad = {
    # ruleid:string-concat-in-list
    "abc"
    "cde"
    "efg",
    "hijk"
}

good = {
    "key1": "value1",
    # ok:string-concat-in-list
    "key2": "value2"
    "value2 continuation",
    "key3": "value3",
}

good = {
    "key1": "value1",
    # ok:string-concat-in-list
    "key2": "value2 {}"
    .format("value2 continuation"),
    "key3": "value3",
}

# ok:string-concat-in-list
good = ["123"]

# ok:string-concat-in-list
good = [123, 456]

# ok:string-concat-in-list
good = ["123", "456"]

# ok:string-concat-in-list
good = [f"123"]

# ok:string-concat-in-list
good = [f"{123}"]

# ok:string-concat-in-list
good = ["123", f"{456}"]
