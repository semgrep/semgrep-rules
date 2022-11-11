<?php

// ruleid: file_inclusion
require $located;

// ruleid: file_inclusion
require_once ABSPATH . 'wp-admin/includes/plugin.php';

// ruleid: file_inclusion
include __DIR__ . '/wp-hooks.php';

// ruleid: file_inclusion
include_once($extension_upload_value);

// ruleid: file_inclusion
$contents = json_decode( fread( $handle, filesize( $eventInfoFile ) ) );

// ruleid: file_inclusion
$read_text_ser = fread($open_txt , filesize($import_txt_path));

//ok: file_inclusion
some_other_function($args);


?>