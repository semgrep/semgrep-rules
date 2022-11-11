<?php

// ruleid: command_execution
exec('rm -rf ' . $dir, $o, $r);

// ruleid: command_execution
$stderr = shell_exec($command);


// ok: command_execution
some_other_safe_function($args);


?>
