let test xs ys =
  (* ruleid:physical-not-equal *)
  if xs != ys
  then 1
  else 2

let test2 xs ys =
  (* ruleid:physical-equal *)
  if xs == ys
  then 1
  else 2
