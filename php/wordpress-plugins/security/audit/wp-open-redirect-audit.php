<?php

// redirect should be followed by exit

// ruleid: wp-open-redirect-audit
wp_redirect( $url);
exit;


// ok: wp-open-redirect-audit
// safe redirect
wp_safe_redirect($url); 
exit;
?>