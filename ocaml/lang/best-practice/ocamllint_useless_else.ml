let test a =
  (* ruleid:ocamllint-useless-else *)
  if a
  then print_string a
  else ()