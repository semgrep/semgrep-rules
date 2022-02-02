let test x =
  (* ruleid:ocamllint-ref-incr *)
  x := !x + 1;
  (* ruleid:ocamllint-ref-decr *)
  x := !x - 1;
  ()
