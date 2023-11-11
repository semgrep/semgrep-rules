<?php

// example key-value: name=%3Cscript%3Econfirm%28%29%3C%2Fscript%3E
function dangerousPrintUsage() {
    $name = $_REQUEST['name'];
    // ruleid: echoed-request
    print("Hello : $name");
    // ruleid: echoed-request
    print("Hello : " . $name);
}

function safePrintUsage() {
    $name = $_REQUEST['name'];
    // ok: echoed-request
    print("Hello : " . htmlentities($name));
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
    echo "Hello ".isset($_POST['name'])." !";
}

function doOK5() {
    $safevar = empty($_GET['name']);
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


