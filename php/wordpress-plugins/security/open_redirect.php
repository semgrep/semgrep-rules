<?php

// redirect should be followed by exit

// ruleid: open_redirect
wp_redirect( $url);
exit;


// ok: open_redirect
// safe redirect
wp_safe_redirect($url); 
exit;
?>