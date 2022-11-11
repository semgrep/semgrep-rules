<?php

// ruleid: csrf
check_ajax_referer( 'wpforms-admin', 'nonce', false );

// ok: csrf
check_ajax_referer( 'wpforms-admin', 'nonce', true );


// ok: csrf
check_ajax_referer( 'wpforms-admin', 'nonce' );

?>