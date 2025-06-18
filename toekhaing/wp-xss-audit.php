<?php

$url = $_GET['url'];
// ruleid: wp-xss-audit
$response = wp_remote_get($url);

$url = $_GET['url'];
// ruleid: wp-xss-audit
$response = wp_safe_remote_get($url);

$url = $_GET['url'];
// ruleid: wp-xss-audit
$response = wp_safe_remote_request($url);

?>