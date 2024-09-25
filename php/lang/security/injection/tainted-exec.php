<?php

$userinput = $_GET['userinput'];

// ruleid: tainted-exec
system("ls $userinput");

$escaped = escapeshellarg($userinput);
// ok: tainted-exec
system("ls $escaped");

$descriptors = [["pipe", "r"], ["pipe", "w"], ["pipe", "w"]];
$pipes = [];

// ruleid: tainted-exec
$p = proc_open("ls $userinput", $descriptors, $pipes);
echo stream_get_contents($pipes[1]);

// ok: tainted-exec
$p = proc_open(["ls", $userinput], $descriptors, $pipes);
echo stream_get_contents($pipes[1]);
