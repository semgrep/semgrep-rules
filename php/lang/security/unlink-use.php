<?php

$data = $_GET["data"];
// ruleid: unlink-use
unlink("/storage/" . $data . "/test");

// ok: unlink-use
unlink('/storage/foobar/test');
