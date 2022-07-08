let () =
  try ()
  with exn ->
    (* ruleid:bad-reraise *)
    raise exn

let () =
  match () with
  | Foo _ ->
      raise Not_found
  | _ as _exn2' ->
      (* ruleid:bad-reraise *)
      raise _exn2'

let () =
  raise (Error "uh oh")

let () =
  raise Exit

(* false positive *)
let () =
  let e = Foo args in
  (* ruleid:bad-reraise *)
  raise e

(* no longer a false positive *)
let () =
  raise (Foo args)
