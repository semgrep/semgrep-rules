<?php

// ruleid: wp-code-execution-audit
$snippetValue = eval('return ' .$sanitizedSnippet . ';');

// ruleid: wp-code-execution-audit
$val = call_user_func($filter, $val);

// ok: wp-code-execution-audit
some_other_safe_function($args);


?>