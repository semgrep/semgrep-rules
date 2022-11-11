<?php

// ruleid: code_execution
$snippetValue = eval('return ' .$sanitizedSnippet . ';');

// ruleid: code_execution
$val = call_user_func($filter, $val);

// ok: code_execution
some_other_safe_function($args);


?>