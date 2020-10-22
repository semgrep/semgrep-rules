let test3 s =
  (* ruleid:ocamllint-str-last-chars *)
  String.sub s (String.length s - 20) 20