<?php

function test1($value) {
    $pass = md5($value);
    // ruleid: md5-used-as-password
    $user->setPassword($pass);
}

function test2($value) {
    $pass = hash('md5', $value);
    // ruleid: md5-used-as-password
    $user->setPassword($pass);
}

function okTest1($value) {
    // ok: md5-used-as-password
    $pass = hash('sha256', $value);
    $user->setPassword($pass);
}
