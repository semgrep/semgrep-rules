<?php

// ruleid: wp-ajax-no-auth-and-auth-hooks-audit
add_action( 'wp_ajax_priv_upload', 'auth_upload' );

// ruleid: wp-ajax-no-auth-and-auth-hooks-audit
add_action( 'wp_ajax_nopriv_upload', 'no_auth_upload');

// ok: wp-ajax-no-auth-and-auth-hooks-audit
add_action('plugins_loaded','upload_plugins_loaded');



?>