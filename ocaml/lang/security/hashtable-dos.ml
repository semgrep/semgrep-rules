(* ruleid:ocamllint-hashtable-dos *)
let h = Hashtbl.create 16 in
for i = 1 to 1000 do Hashtbl.add h i (i * 2) done;
Printf.printf "%i elements\n" (Hashtbl.length h);

let j = Hashtbl.create 16 ~random:true in
for i = 1 to 1000 do Hashtbl.add j i (i * 2) done;
Printf.printf "%i elements\n" (Hashtbl.length j);
