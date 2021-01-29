let test s =
  (* ruleid:ocamllint-str-first-chars *)
  String.sub s 0 20

let test2 s =
  (* ruleid:ocamllint-str-string-after *)
  String.sub s 20 (String.length s - 20)

let test3 s =
  (* ruleid:ocamllint-str-last-chars *)
  String.sub s (String.length s - 20) 20


let test 4 s =
  (* ruleid:ocamllint-useless-sprintf *)
  let s1 = Printf.sprintf "this is useless" in
  (* ruleid:ocamllint-useless-sprintf *)
  let s2 = Printf.sprintf "%s" "this is also useless" in
  let s3 = Printf.sprintf "this is an %d int" 2 in
  ()
