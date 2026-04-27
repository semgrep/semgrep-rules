let test1 () =
  let m = Mutex.create () in
  (* ruleid:mutex-lock-exn *)
  Mutex.lock m;
  ignore (1 + 1);
  Mutex.unlock m

let test2 () =
  let m = Mutex.create () in
  (* ok *)
  ignore (Mutex.protect m (fun () -> 1 + 1));

