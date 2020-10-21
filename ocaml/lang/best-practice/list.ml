let test1 xs =
  (* ruleid:list-find-outside-try *)
  if List.find 1 xs
  then 1
  else 2

let test2 xs =
 (* ok *)
 try
   if List.find 1 xs
   then 1
   else 2
 with Not_found -> 3
