<?php

// ruleid: wp-command-execution-audit
exec('rm -rf ' . $dir, $o, $r);

// ruleid: wp-command-execution-audit
$stderr = shell_exec($command);


// ok: wp-command-execution-audit
some_other_safe_function($args);


?>
