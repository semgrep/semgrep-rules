<?php

// ruleid: md5-loose-equality
md5("240610708") == "0";

// ruleid: md5-loose-equality
0 == md5("240610708");

// ruleid: md5-loose-equality
0 == md5_file("file.txt");

// ruleid: md5-loose-equality
md5("240610708") == md5_file("file.txt");

// ok: md5-loose-equality
md5("240610708") === "0";

$hash = hash('sha256', 'hello');
$something = "32";

// ok: md5-loose-equality
strlen($hash) == $something;

// ruleid: md5-loose-equality
$hash == $something;
