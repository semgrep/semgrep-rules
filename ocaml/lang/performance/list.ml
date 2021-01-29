let test xs =
  (* ruleid:ocamllint-length-list-zero *)
  if List.length xs = 0
  then 1
  else 2

let test2 xs =
  (* ruleid:ocamllint-length-more-than-zero *)
  if List.length xs > 0
  then 1
  else 2
