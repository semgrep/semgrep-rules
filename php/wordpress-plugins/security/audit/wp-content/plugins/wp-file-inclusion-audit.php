<?php

// ruleid: wp-file-inclusion-audit
require $located;

// ruleid: wp-file-inclusion-audit
require_once ABSPATH . 'wp-admin/includes/plugin.php';

// ruleid: wp-file-inclusion-audit
include __DIR__ . '/wp-hooks.php';

// ruleid: wp-file-inclusion-audit
include_once($extension_upload_value);

// ruleid: wp-file-inclusion-audit
$contents = json_decode( fread( $handle, filesize( $eventInfoFile ) ) );

// ruleid: wp-file-inclusion-audit
$read_text_ser = fread($open_txt , filesize($import_txt_path));

//ok: wp-file-inclusion-audit
some_other_function($args);


?>