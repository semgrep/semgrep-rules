#load "unix.cma";;
let p = String.concat "ls " [" "; Sys.argv.(1)]
(* ruleid:ocamllint-exec *)
let a = Unix.execve p
(* ruleid:ocamllint-exec *)
let b = Unix.execvp p
(* ruleid:ocamllint-exec *)
let c = Unix.execvpe p
(* ruleid:ocamllint-exec *)
let d = Unix.system p
(* ruleid:ocamllint-exec *)
let e = Sys.command p
