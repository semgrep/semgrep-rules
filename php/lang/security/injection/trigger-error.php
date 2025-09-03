<?php

$id = $_GET['id'];
if (!is_numeric($id)) {
    // ruleid: trigger-error
    trigger_error("Not a number: $id");

    // ok: trigger-error
    trigger_error('Not a number: ' . htmlentities($id));

    ini_set('display_errors', 0);
    // ok: trigger-error
    trigger_error("Not a number: $id");
}

