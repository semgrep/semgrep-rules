(* ruleid:ocamllint-marshal *)
let d = input_value stdin in
  Printf.printf "%d\n" (Buffer.length d)
