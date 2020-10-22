let test a =
  (* ruleid:ocamllint-bool-true *)
  let x = a = true in
  (* ruleid:ocamllint-bool-true *)
  let x = a == true in
  (* ruleid:ocamllint-bool-true *)
  let x = a != false in
  ()
