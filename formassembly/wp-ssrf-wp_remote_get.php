<?php

// 🚨 Vulnerable: User-controlled URL from $_GET passed to wp_remote_get()
// ruleid: wp-ssrf-wp_remote_get
$url = $_GET['url'];
$response = wp_remote_get($url);

// 🚨 Vulnerable: User input from $_POST
// ruleid: wp-ssrf-wp_remote_get
$response = wp_remote_get($_POST['link']);

// 🚨 Vulnerable: Using $_REQUEST, which combines GET, POST, and COOKIE
// ruleid: wp-ssrf-wp_remote_get
$response = wp_remote_get($_REQUEST['target']);

// 🚨 Vulnerable: Fetching user-controlled options (could be manipulated by an admin or attacker)
// ruleid: wp-ssrf-wp_remote_get
$url = get_option('external_api_url');
$response = wp_remote_get($url);

// 🚨 Vulnerable: User metadata could be attacker-controlled
// ruleid: wp-ssrf-wp_remote_get
$url = get_user_meta(get_current_user_id(), 'custom_api', true);
$response = wp_remote_get($url);

// 🚨 Vulnerable: Query variable may come from user input
// ruleid: wp-ssrf-wp_remote_get
$url = get_query_var('redirect_url');
$response = wp_remote_get($url);

// ✅ Safe: Hardcoded URL
// ok: wp-ssrf-wp_remote_get
$response = wp_remote_get('https://example.com/api/data');

// ✅ Safe: Using wp_safe_remote_get()
// ok: wp-ssrf-wp_remote_get
$response = wp_safe_remote_get($_GET['url']); 
// This is the recommended way to prevent SSRF

?>