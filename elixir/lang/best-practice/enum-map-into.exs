# ruleid: enum_map_into
Enum.into(Enum.map(%{a: 1, b: 2}, fn {k, v} -> {k, v * 2} end), %{})

# ruleid: enum_map_into
Enum.map(%{a: 1, b: 2}, fn {k, v} -> {k, v * 2} end)
|> Enum.into(%{})

# ruleid: enum_map_into
%{a: 1, b: 2}
|> Enum.map(fn {k, v} -> {k, v * 2} end)
|> Enum.into(%{})
