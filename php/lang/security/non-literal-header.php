<?php

$data = $_GET["data"];
// ruleid: non-literal-header
header("Some-Header: $data");

$data = $_GET["data"];
// ruleid: non-literal-header
header("Some-Header: ".$data);

// ok: non-literal-header
header("Some-Header: value");
