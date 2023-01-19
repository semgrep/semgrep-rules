<?php

// ruleid: wp-file-manipulation-audit
wp_delete_file( $file_path );

// ruleid: wp-file-manipulation-audit
unlink($file_path);

// ok: wp-file-manipulation-audit
some_other_function($args);


?>
