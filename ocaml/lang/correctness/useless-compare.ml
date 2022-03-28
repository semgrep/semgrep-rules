let test a b =
  (* ruleid:useless-compare *)
  let c = compare (a+b) (a+b) in
  if c <> 0 then c
  else
    compare a b

let test a b =
  (* ruleid:useless-compare *)
  let c = Int.compare (a+b) (a+b) in
  if c <> 0 then c
  else
    compare a b

