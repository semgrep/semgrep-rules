let test a =
  (* ruleid:ocamllint-bool-false *)
  let x = a = false in
  (* ruleid:ocamllint-bool-false *)
  let x = a == false in
  (* ruleid:ocamllint-bool-false *)
  let x = a <> true in
  ()