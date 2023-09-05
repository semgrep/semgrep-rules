#load "unix.cma";;
(* ruleid:ocamllint-exec *)
let a = Unix.execve "ls"
(* ruleid:ocamllint-exec *)
let b = Unix.execvp "ls"
(* ruleid:ocamllint-exec *)
let c = Unix.execvpe "ls"
(* ruleid:ocamllint-exec *)
let d = Unix.system "ls"
(* ruleid:ocamllint-exec *)
let e = Sys.command "ls"
