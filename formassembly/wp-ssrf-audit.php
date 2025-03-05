<?php

// 🚨 Vulnerable: User-controlled URL from $_GET passed to wp_remote_get()
// ruleid: wp-ssrf-audit
$url = $_GET['url'];
$response = wp_remote_get($url);

// 🚨 Vulnerable: User-controlled URL from $_GET passed to wp_safe_remote_get()
// ruleid: wp-ssrf-audit
$url = $_GET['url'];
$response = wp_safe_remote_get($url);

// 🚨 Vulnerable: User-controlled URL from $_GET passed to wp_safe_remote_request()
// ruleid: wp-ssrf-audit
$url = $_GET['url'];
$response = wp_safe_remote_request($url);

// 🚨 Vulnerable: User-controlled URL from $_GET passed to wp_safe_remote_head()
// ruleid: wp-ssrf-audit
$url = $_GET['url'];
$response = wp_safe_remote_head($url);

// 🚨 Vulnerable: User-controlled URL from $_GET passed to wp_oembed_get()
// ruleid: wp-ssrf-audit
$url = $_GET['url'];
$response = wp_oembed_get($url);

// 🚨 Vulnerable: User-controlled URL from $_GET passed to vip_safe_wp_remote_get()
// ruleid: wp-ssrf-audit
$url = $_GET['url'];
$response = vip_safe_wp_remote_get($url);

// 🚨 Vulnerable: User-controlled URL from $_GET passed to wp_safe_remote_post()
// ruleid: wp-ssrf-audit
$url = $_GET['url'];
$response = wp_safe_remote_post($url);

// 🚨 Vulnerable: User input from $_POST
// ruleid: wp-ssrf-audit
$response = wp_remote_get($_POST['link']);

// 🚨 Vulnerable: User input from $_POST
// ruleid: wp-ssrf-audit
$response = wp_safe_remote_post($_POST['link']);

// 🚨 Vulnerable: Using $_REQUEST, which combines GET, POST, and COOKIE
// ruleid: wp-ssrf-audit
$response = wp_remote_get($_REQUEST['target']);

// 🚨 Vulnerable: Using $_REQUEST, which combines GET, POST, and COOKIE
// ruleid: wp-ssrf-audit
$response = wp_safe_remote_request($_REQUEST['target']);

// 🚨 Vulnerable: Fetching user-controlled options (could be manipulated by an admin or attacker)
// ruleid: wp-ssrf-audit
$url = get_option('external_api_url');
$response = wp_remote_get($url);

// 🚨 Vulnerable: User metadata could be attacker-controlled
// ruleid: wp-ssrf-audit
$url = get_user_meta(get_current_user_id(), 'custom_api', true);
$response = wp_remote_get($url);

// 🚨 Vulnerable: Query variable may come from user input
// ruleid: wp-ssrf-audit
$url = get_query_var('redirect_url');
$response = wp_remote_get($url);

// ✅ Safe: Hardcoded URL
// ok: wp-ssrf-audit
$response = wp_remote_get('https://example.com/api/data');

?>