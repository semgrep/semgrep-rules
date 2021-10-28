<?php

function make_request($url) {
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HEADER, 0);

    $data = curl_exec($ch);
    curl_close($ch);

    return $data;
}

// True Positives

function test1() {
    // ruleid: tainted-url-host
    $url = 'https://'.$_GET['url'].'/foobar';
    $info = make_request($url);
    return $info;
}

function test2() {
    $part = $_POST['url'];
    // ruleid: tainted-url-host
    $url = "https://$part/foobar";
    $info = make_request($url);
    return $info;
}

function test3() {
    // ruleid: tainted-url-host
    $url = "https://{$_REQUEST['url']}/foobar";
    $info = make_request($url);
    return $info;
}

function test4() {
    // ruleid: tainted-url-host
    $url = sprintf('https://%s/%s/', $_COOKIE['foo'], $bar);
    $info = make_request($url);
    return $info;
}

// True Negatives

function test1() {
    // ok: tainted-url-host
    $url = 'https://www.google.com/'.$_GET['url'].'/foobar';
    $info = make_request($url);
    return $info;
}

function test2() {
    $part = $_POST['url'];
    // ok: tainted-url-host
    $url = "some random text /$part/ foobar";
    $info = make_request($url);
    return $info;
}

function test3() {
    // ok: tainted-url-host
    $url = "https://www.google.com/{$_REQUEST['url']}/foobar";
    $info = make_request($url);
    return $info;
}

function test4() {
    // ok: tainted-url-host
    $url = sprintf('some random format string %s %s', $_COOKIE['foo'], $bar);
    $info = make_request($url);
    return $info;
}
