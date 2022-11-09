# ruleid: useless-literal-set
s = set((1, "a"), (2, "b"), (1, "a"))

# ok: useless-literal-set
s = set((1, "a"), (2, "b"), (3, "c"))
