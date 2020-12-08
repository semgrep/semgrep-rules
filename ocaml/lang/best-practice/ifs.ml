let test a =
  (* ruleid:ocamllint-useless-else *)
  if a
  then print_string a
  else ()

let test2 a =
  (* ruleid:ocamllint-backwards-if *)
  if a
  then ()
  else print_string a
