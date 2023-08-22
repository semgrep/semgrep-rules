# ruleid: enum_map_join
Enum.join(Enum.map(["a", "b", "c"], fn s -> String.upcase(s) end), ", ")

# ruleid: enum_map_join
Enum.map(["a", "b", "c"], fn s -> String.upcase(s) end)
|> Enum.join(", ")

# ruleid: enum_map_join
["a", "b", "c"]
|> Enum.map(fn s -> String.upcase(s) end)
|> Enum.join(", ")
