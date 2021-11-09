let test1 xs =
  (* ruleid:hashtbl-find-outside-try *)
  if Hashtbl.find h 1
  then 1
  else 2

let test2 xs =
 (* ok *)
 try
   if Hashtbl.find h 1
   then 1
   else 2
 with Not_found -> 3

let test3 xs =
 (* ok *)
 match Hashtbl.find h 1 with
 | true -> 1
 | false -> 2
 | exception Not_found -> 3
