<?php

// example key-value: name=%3Cscript%3Econfirm%28%29%3C%2Fscript%3E
function dangerousEchoUsage() {
    $name = $_REQUEST['name'];
    // ruleid: echoed-request
    echo "Hello : $name";
    // ruleid: echoed-request
    echo "Hello : " . $name;
}

function safeEchoUsage() {
    $name = $_REQUEST['name'];
    // ok: echoed-request
    echo "Hello : " . htmlentities($name);
}

function doSmth() {
    $name = $_REQUEST['name'];
    // ruleid: echoed-request
    echo "Hello :".$name;
}

function doSmth2() {
    // ruleid: echoed-request
    echo "Hello ".$_POST['name']." !";
}

function doSmth3() {
    $name = $_GET['name'];
    if (str_contains($name, 'foobar')) {
        // ruleid: echoed-request
        echo "Hello :".$name;
    }
}

function doSmth4() {
    // ruleid: echoed-request
    echo "Hello ".htmlentities($_POST['name'])." !".$_POST['lastname'];
}

function doSmth5() {
     // ruleid: echoed-request
    echo "Hello ".trim($_POST['name']);
}

function doSmth6() {
   $VAR = $_GET['someval'];
    if(isset($VAR)){ 
        // ruleid: echoed-request
        echo $VAR; 
    }
}

function doSmth7() {
    $VAR = $_GET['someval'];
     if(empty($VAR)){ 
         // ruleid: echoed-request
         echo $VAR; 
     }
 }

function doOK1() {
    // ok: echoed-request
    echo "Hello ".htmlentities($_POST['name'])." !";
}

function doOK2() {
    $input = $_GET['name'];
    // ok: echoed-request
    echo "Hello ".htmlspecialchars($input)." !";
}

function doOK3() {
    $safevar = "Hello ".htmlentities(trim($_GET['name']));
    // ok: echoed-request
    echo $safevar;
}

function doOK4() {
    // ok: echoed-request
    echo "Hello ".e($_POST['name'])." !";
}

function doOK5() {
    $safevar = esc_attr($_GET['name']);
    // ok: echoed-request
    echo "Hello $safevar !";
}

function doOK6() {
    $safevar = "Hello ".htmlentities($_GET['name']);
    // ok: echoed-request
    echo $safevar;
}

function doOK7() {
    $safevar = "Hello ".htmlspecialchars($_GET['name']);
    // ok: echoed-request
    echo $safevar;
}

function doOK8() {
    // ok: echoed-request
    echo "Hello ".isset($_POST['name'])." !";
}

function doOK9() {
    $safevar = empty($_GET['name']);
    // ok: echoed-request
    echo "Hello $safevar !";
}

