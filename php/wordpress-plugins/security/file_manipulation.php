<?php

// ruleid: file_manipulation
wp_delete_file( $file_path );

// ruleid: file_manipulation
unlink($file_path);

// ok: file_manipulation
some_other_function($args);


?>
