let test xs =
  (* ruleid:ocamllint-length-list-zero,ocamllint-length-list-compare *)
  if List.length xs = 0
  then 1
  else 2

let test2 xs =
  (* ruleid:ocamllint-length-more-than-zero,ocamllint-length-list-compare *)
  if List.length xs > 0
  then 1
  else 2
