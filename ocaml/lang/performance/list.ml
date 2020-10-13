let test xs =
  (* ruleid:length-list-zero *)
  if List.length xs = 0
  then 1
  else 2
