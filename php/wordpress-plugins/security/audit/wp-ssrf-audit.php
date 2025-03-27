<?php

$url = $_GET['url'];
// ruleid: wp-ssrf-audit
$response = wp_remote_get($url);

$url = $_GET['url'];
// ruleid: wp-ssrf-audit
$response = wp_safe_remote_get($url);

$url = $_GET['url'];
// ruleid: wp-ssrf-audit
$response = wp_safe_remote_request($url);

$url = $_GET['url'];
// ruleid: wp-ssrf-audit
$response = wp_safe_remote_head($url);

$url = $_GET['url'];
// ruleid: wp-ssrf-audit
$response = wp_oembed_get($url);

$url = $_GET['url'];
// ruleid: wp-ssrf-audit
$response = vip_safe_wp_remote_get($url);

$url = $_GET['url'];
// ruleid: wp-ssrf-audit
$response = wp_safe_remote_post($url);

// ruleid: wp-ssrf-audit
$response = wp_remote_get($_POST['link']);

// ruleid: wp-ssrf-audit
$response = wp_safe_remote_post($_POST['link']);

// ruleid: wp-ssrf-audit
$response = wp_remote_get($_REQUEST['target']);

// ruleid: wp-ssrf-audit
$response = wp_safe_remote_request($_REQUEST['target']);

$url = get_option('external_api_url');
// ruleid: wp-ssrf-audit
$response = wp_remote_get($url);

$url = get_user_meta(get_current_user_id(), 'custom_api', true);
// ruleid: wp-ssrf-audit
$response = wp_remote_get($url);

$url = get_query_var('redirect_url');
// ruleid: wp-ssrf-audit
$response = wp_remote_get($url);

// ok: wp-ssrf-audit
$response = wp_remote_get('https://example.com/api/data');

?>