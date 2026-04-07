let test1 xs =
  (* ruleid:hashtbl-find-outside-try *)
  if Hashtbl.find h 1
  then 1
  else 2

let test2 xs =
  (* ok *)
  try Hashtbl.find h 1
  with Not_found -> 3

let test2 xs =
  (* ok *)
  try
    if Hashtbl.find h 1
    then 1
    else 2
  with Not_found -> 3

let test3 xs =
  try
    (* ruleid:hashtbl-find-outside-try *)
    if Hashtbl.find h 1
    then failwith "error"
    else 2
  with Failure _ -> 3

let test4 xs =
  (* ruleid:hashtbl-find-outside-try *)
  match Hashtbl.find h 1 with
  | true -> 1
  | false -> 2

let test5 xs =
  (* false positive, needs fixing. See notes in the rule. *)
  (* ruleid:hashtbl-find-outside-try *)
  match Hashtbl.find h 1 with
  | true -> 1
  | false -> 2
  | exception Not_found -> 3
