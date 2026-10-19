<?php

// ok: file-inclusion
include("pages/constant.php");  // Hardcoded - safe

$page = $_GET['page'];
debug_log("User requested GET page: " . $page);
// ruleid: file-inclusion
include("pages/" . $page . ".php");

if (isset($_POST['loadpage'])) {
    $target = $_POST['loadpage'];
    debug_log("User POSTed page: " . $target);
    // ruleid: file-inclusion
    include("pages/" . $target . ".php");
}

// --- VULNERABLE FILE INCLUSION from GET using require ---
$section = $_GET['section'];
// ruleid: file-inclusion
require("modules/" . $section . ".php");  // LFI vulnerability

// --- VULNERABLE FILE INCLUSION from COOKIE using require_once ---
if (isset($_COOKIE['module'])) {
    $mod = $_COOKIE['module'];
    // ruleid: file-inclusion
    require_once("modules/" . $mod . ".php");  // LFI vulnerability
}

$safe_module = 'default';
// ok: file-inclusion
require("modules/" . $safe_module . ".php");  // Safe hardcoded variable

// --- SAFE: Whitelisted GET input (include) ---

$input = $_GET['p'];
if (in_array($input, ['home', 'about', 'contact'])) {
    // ok: file-inclusion
    include("pages/" . $input . ".php");  // Whitelisted - safe
}

// --- SAFE: require_once hardcoded footer ---
// ok: file-inclusion
require_once("includes/footer.php");  // Hardcoded - safe

?>