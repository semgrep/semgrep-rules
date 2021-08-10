let test a b =
  (* ruleid:useless-equal *)
  if a+b = a+b
  then 1
  else 2
