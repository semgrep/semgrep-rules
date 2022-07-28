# ruleid: useless-literal
d = dict((1, "a"), (2, "b"), (1, "a"))

d = dict(
    # ruleid: useless-literal
    (1, "a"),
    (2, "b"),
    (1, "a"),
)

# ruleid: useless-literal
d = {1: "a", 2: "b", 1: "a"}
d = {
    1: "a",
    2: "b",
    # ruleid: useless-literal
    1: "a",
}
# ruleid: useless-literal
d = {"a": 1, "a": 1}

# ok: useless-literal
d = {1: "a", 2: "b", 3: "a"}
