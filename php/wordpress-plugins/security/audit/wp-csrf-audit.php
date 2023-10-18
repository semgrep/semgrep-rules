<?php

// ruleid: wp-csrf-audit
check_ajax_referer( 'wpforms-admin', 'nonce', false );

// ok: wp-csrf-audit
check_ajax_referer( 'wpforms-admin', 'nonce', true );


// ok: wp-csrf-audit
check_ajax_referer( 'wpforms-admin', 'nonce' );

?>