(* ruleid:ocamllint-tempfile *)
let ofile = Filename.temp_file "test" "" in
Printf.printf "%s\n" ofile
