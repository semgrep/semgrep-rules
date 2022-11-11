<?php

// ruleid: ajax_no_auth_and_auth_hooks
add_action( 'wp_ajax_priv_upload', 'auth_upload' );

// ruleid: ajax_no_auth_and_auth_hooks
add_action( 'wp_ajax_nopriv_upload', 'no_auth_upload');

// ok: ajax_no_auth_and_auth_hooks
add_action('plugins_loaded','upload_plugins_loaded');



?>