<?php

// ruleid: php_object_injection
$content = unserialize($POST['post_content']);

// ruleid: php_object_injection
$rank_math=unserialize($rank_value);

// ruleid: php_object_injection
$import_options = maybe_unserialize($import->options);

// ruleid: php_object_injection
$data = unserialize(base64_decode($var));

// ok: php_object_injection
$data = serialize(base64_encode($var))

?>