# ruleid: enum_map_into
%{a: 1, b: 2}
|> Enum.into(%{}, fn {k, v} -> {k, v * 2} end)

# ruleid: enum_map_into
%{a: 1, b: 2}
|> Enum.into(%{}, fn {k, v} -> {k, v * 2} end)

# ruleid: enum_map_into
%{a: 1, b: 2}
|> Enum.into(%{}, fn {k, v} -> {k, v * 2} end)
