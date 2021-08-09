let get_line ic =
  try
    (* ruleid:broken-input-line *)
    Some (input_line ic)
  with
    End_of_file -> None

let with_in_file path f =
  (* ruleid:prefer-read-in-binary-mode *)
  let ic = open_in path in
  Fun.protect
    ~finally:(fun () -> close_in_noerr ic)
    (fun () -> f ic)

let with_in_file path f =
  (* ruleid:prefer-write-in-binary-mode *)
  let oc = open_out path in
  Fun.protect
    ~finally:(fun () -> close_out_noerr oc)
    (fun () -> f oc)

(* Force text mode without triggering alert *)
let with_in_text path f =
  let ic = open_in_gen [Open_text] 0o000 path in
  Fun.protect
    ~finally:(fun () -> close_in_noerr ic)
    (fun () -> f ic)

(* Force text mode without triggering alert *)
let with_out_text path f =
  let oc = open_out_gen [Open_text] 0o666 path in
  Fun.protect
    ~finally:(fun () -> close_out_noerr oc)
    (fun () -> f oc)
