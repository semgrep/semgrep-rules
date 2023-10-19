<?php

// ruleid: wp-authorisation-checks-audit
if ( is_admin() ) {
}

// ruleid: wp-authorisation-checks-audit
return is_user_logged_in() ? get_current_user_id() : '';

// ruleid: wp-authorisation-checks-audit
if ( ! current_user_can( 'install_languages' ) ) {

}

// ok: wp-authorisation-checks-audit
get_current_user_id();



?>