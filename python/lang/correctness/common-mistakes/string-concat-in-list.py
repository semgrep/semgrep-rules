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

good = ["123"]
good = [123, 456]
good = ["123", "456"]
good = [f"123"]
good = [f"{123}"]
good = ["123", f"{456}"]
