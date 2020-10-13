let test a =
  (* ruleid:not-portable-tmp-string *)
  let path = Filename.concat "/tmp" a in
  print_string path
