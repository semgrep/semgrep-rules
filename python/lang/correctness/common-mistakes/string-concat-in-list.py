# ruleid:string-concat-in-list
bad = ["123" "456" "789"]

# ruleid:string-concat-in-list
bad = ["123" f"{456}" "789"]

# ruleid:string-concat-in-list
bad = [
    "abc"
    "cde"
    "efg",
    "hijk"
]

# ruleid:string-concat-in-list
bad = [
    "abc",
    "cde"
    "efg"
    "hijk"
]

# ruleid:string-concat-in-list
bad = [
    "abc",
    "cde"
    f"efg"
    "hijk"
]

good = ["123"]
good = [123, 456]
good = ["123", "456"]
good = [f"123"]
good = [f"{123}"]
good = ["123", f"{456}"]
