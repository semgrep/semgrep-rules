<?php

// ruleid: sha224-hash
var_dump(hash('sha224', 'mypassword'));

// ruleid: sha224-hash
var_dump(hash('sha512/224', 'mypassword'));

// ruleid: sha224-hash
var_dump(hash('sha3-224', 'mypassword'));

// ruleid: sha224-hash
var_dump(hash_hmac('sha224', 'mypassword'));

// ruleid: sha224-hash
var_dump(hash_hmac('sha512/224', 'mypassword'));

// ruleid: sha224-hash
var_dump(hash_hmac('sha3-224', 'mypassword'));

// ok: sha224-hash
var_dump(hash('sha384', 'mypassword'));
