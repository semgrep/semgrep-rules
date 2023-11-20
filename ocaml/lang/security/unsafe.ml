let cb = Array.make 10 2 in
(* ruleid:ocamllint-unsafe *)
Printf.printf "%d\n" (Array.unsafe_get cb 12)
