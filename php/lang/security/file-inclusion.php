<?php

$user_input = $_GET["tainted"];

// ruleid: file-inclusion
include($user_input);

// ok: file-inclusion
include('constant.php');

// ruleid: file-inclusion
include_once($user_input);

// ok: file-inclusion
include_once('constant.php');

// ruleid: file-inclusion
require($user_input);

// ok: file-inclusion
require('constant.php');

// ruleid: file-inclusion
require_once($user_input);

// ok: file-inclusion
require_once('constant.php');

// ruleid: file-inclusion
include(__DIR__ . $user_input);

// ok: file-inclusion
include(__DIR__ . 'constant.php');

// ok: file-inclusion
include_safe(__DIR__ . $user_input);

// ok: file-inclusion
require_once(CONFIG_DIR . '/constant.php');

// ok: file-inclusion
require_once( dirname( __FILE__ ) . '/admin.php' );

// ok: file-inclusion
$pth = 'foo/bar.php';
require_once $pth;
