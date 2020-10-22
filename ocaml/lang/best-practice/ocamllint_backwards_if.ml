let test2 a =
  (* ruleid:ocamllint-backwards-if *)
  if a
  then ()
  else print_string a
