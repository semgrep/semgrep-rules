<?php

// ruleid: wp-php-object-injection-audit
$content = unserialize($POST['post_content']);

// ruleid: wp-php-object-injection-audit
$rank_math=unserialize($rank_value);

// ruleid: wp-php-object-injection-audit
$import_options = maybe_unserialize($import->options);

// ruleid: wp-php-object-injection-audit
$data = unserialize(base64_decode($var));

// ok: wp-php-object-injection-audit
$data = serialize(base64_encode($var))

?>