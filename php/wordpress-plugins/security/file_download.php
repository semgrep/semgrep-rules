<?php

// ruleid: file_download
$json = file_get_contents( 'php://input' );

// ruleid: file_download
readfile($zip_name);

// ruleid: file_download
$localeFunctions = file($functionNamesFile, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

// ok: file_download
some_other_function($args);


?>
