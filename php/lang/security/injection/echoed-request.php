<?php

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
    $name = $_GET['name'];
    if (str_contains($name, 'foobar')) {
        $tpl = createSafeTemplate($name);
        // ok: echoed-request
        echo "Hello :".$tpl;
    }
}