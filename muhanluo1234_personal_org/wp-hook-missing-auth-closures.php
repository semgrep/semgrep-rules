<?php

// ok: wp-hook-missing-auth-closures
add_action("wp_ajax_action_performed", function($user) {
	echo "HELLO";
    if (current_user_can("read") and $user == true) {
        return 1;
    }
    else {
        return 0;
    }
	return 0;
}, 5, 1);

// ruleid: wp-hook-missing-auth-closures
add_action("admin_init", function() {
	echo "HELLO";
    if (blabla("123") or 5 + 5 == 1) {
        return 1;
    }
	echo "BYE";
}, 2, 1);

// ruleid: wp-hook-missing-auth-closures
add_action( 'admin_action_do_something', function( $folders ) {
	echo "HELLO";
    current_user_can("read");
    if (blabla("123") and $folders == true) {
        return 1;
    }
	echo "BYE";
		},          9999 );

// ok: wp-hook-missing-auth-closures
add_action("profile_update", function() {
    if (3 + 3 == 4 or current_user_can("write")) {
        return 1;
    }
});

// ok: wp-hook-missing-auth-closures
add_action( 'wp_ajax_nopriv_action', function($read, $write) {
	echo "HELLO";
    if (blabla("123") and false == true) {
        return 1;
    }
    else if (true == true and current_user_can("read") or 1 == 1) { echo "BYE"; }
	});

?>