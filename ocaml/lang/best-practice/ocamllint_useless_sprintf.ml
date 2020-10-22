let test 4 s =
  (* ruleid:ocamllint-useless-sprintf *)
  let s1 = Printf.sprintf "this is useless" in
  (* ruleid:ocamllint-useless-sprintf *)
  let s2 = Printf.sprintf "%s" "this is also useless" in
  let s3 = Printf.sprintf "this is an %d int" 2 in
  ()
