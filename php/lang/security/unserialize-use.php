<?php

$data = $_GET["data"];
// ruleid: unserialize-use
$object = unserialize($data);

// ok: unserialize-use
$object2 = unserialize('O:1:"a":1:{s:5:"value";s:3:"100";}');
