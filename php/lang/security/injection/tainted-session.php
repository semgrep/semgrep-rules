<?php

// ruleid: tainted-session
$_SESSION[$_POST['input']] = true;

$inputA = $_POST['input'];
// ruleid: tainted-session
$_SESSION[$inputA] = true;

// ok: tainted-session
$_SESSION['prefix' . $_POST['input']] = true;

// ok: tainted-session
$_SESSION['prefix'][$_POST['input']] = true;

// ok: tainted-session
$_SESSION['key'] = $_POST['input'];

$inputB = $_POST['input'];
$inputB = md5($inputB);
// ok: tainted-session
$_SESSION[$inputB] = true;

$inputC = $_POST['input'];
$inputC = trim($inputC);
// ruleid: tainted-session
$_SESSION[$inputC] = true;
