<?php

// ruleid: weak-crypto
$hashed_password = crypt('mypassword');

// ruleid: weak-crypto
$hashed_password = md5('mypassword');

// ruleid: weak-crypto
$hashed_password = md5_file('filename.txt');

// ruleid: weak-crypto
$hashed_password = sha1('mypassword');

// ruleid: weak-crypto
$hashed_password = sha1_file('filename.txt');

// ruleid: weak-crypto
$hashed_password = str_rot13('totally secure');

// ok: weak-crypto
$hashed_password = sodium_crypto_generichash('mypassword');
