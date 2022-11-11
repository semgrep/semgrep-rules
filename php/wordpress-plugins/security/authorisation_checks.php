<?php

// ruleid: authorisation_checks
if ( is_admin() ) {
}

// ruleid: authorisation_checks
return is_user_logged_in() ? get_current_user_id() : '';

// ruleid: authorisation_checks
if ( ! current_user_can( 'install_languages' ) ) {

}

// ok: authorisation_checks
get_current_user_id();



?>