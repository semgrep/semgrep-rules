<?php

$tainted = $_GET["tainted"];
// ruleid: tainted-filename
hash_file('sha1', $tainted);

// ruleid: tainted-filename
file($tainted);

// ok: tainted-filename
hash_file($tainted, 'file.txt');

// ruleid: tainted-filename
file(dirname($tainted));

// Sanitized
// ok: tainted-filename
file(basename($tainted));


