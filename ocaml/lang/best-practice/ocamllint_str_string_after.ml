let test2 s =
  (* ruleid:ocamllint-str-string-after *)
  String.sub s 20 (String.length s - 20)