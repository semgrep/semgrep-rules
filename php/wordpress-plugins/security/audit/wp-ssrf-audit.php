<?php

// ruleid: wp-ssrf-audit
$url = $_GET['url'];
$response = wp_remote_get($url);

// ruleid: wp-ssrf-audit
$url = $_GET['url'];
$response = wp_safe_remote_get($url);

// ruleid: wp-ssrf-audit
$url = $_GET['url'];
$response = wp_safe_remote_request($url);

// ruleid: wp-ssrf-audit
$url = $_GET['url'];
$response = wp_safe_remote_head($url);

// ruleid: wp-ssrf-audit
$url = $_GET['url'];
$response = wp_oembed_get($url);

// ruleid: wp-ssrf-audit
$url = $_GET['url'];
$response = vip_safe_wp_remote_get($url);

// ruleid: wp-ssrf-audit
$url = $_GET['url'];
$response = wp_safe_remote_post($url);

// ruleid: wp-ssrf-audit
$response = wp_remote_get($_POST['link']);

// ruleid: wp-ssrf-audit
$response = wp_safe_remote_post($_POST['link']);

// ruleid: wp-ssrf-audit
$response = wp_remote_get($_REQUEST['target']);

// ruleid: wp-ssrf-audit
$response = wp_safe_remote_request($_REQUEST['target']);

// ruleid: wp-ssrf-audit
$url = get_option('external_api_url');
$response = wp_remote_get($url);

// ruleid: wp-ssrf-audit
$url = get_user_meta(get_current_user_id(), 'custom_api', true);
$response = wp_remote_get($url);

// ruleid: wp-ssrf-audit
$url = get_query_var('redirect_url');
$response = wp_remote_get($url);

// ok: wp-ssrf-audit
$response = wp_remote_get('https://example.com/api/data');

?>