let test a b =
  (* ruleid:ocamllint-useless-if *)
  if foo
  then a+b
  else a+b
