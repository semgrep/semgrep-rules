let _ =
  testing_function "MD5";
  (* ruleid: no-md5 *)
  let hash s = hash_string (Hash.md5()) s in
  test 1 (hash "") (hex "D41D8CD98F00B204E9800998ECF8427E");
  test 2 (hash "a") (hex "0CC175B9C0F1B6A831C399E269772661");
  test 3 (hash "abc") (hex "900150983CD24FB0D6963F7D28E17F72");
  test 4 (hash "message digest")
         (hex "F96B697D7CB7938D525A2F31AAF161D0")

let _ =
  testing_function "HMAC-MD5";
  test 1
    (* ruleid: no-md5 *)
    (hash_string (MAC.hmac_md5 (hex "0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b"))
                 "Hi There")
    (hex "9294727a3638bb1c13f48ef8158bfc9d");
  test 2
    (* ruleid: no-md5 *)
    (hash_string (MAC.hmac_md5 "Jefe")
                 "BAD!!")
    (hex "750c783e6ab0b503eaa86e310a5db738");
  test 3
    (* ruleid: no-md5 *)
    (hash_string (MAC.hmac_md5 (hex "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"))
                 (String.make 50 '\221'))
    (hex "56be34521d144c88dbb8c733f0e8b3f6")
