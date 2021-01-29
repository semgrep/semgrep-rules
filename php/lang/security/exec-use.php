<?php

// ruleid: exec-use
exec($user_input);

// ok: exec-use
exec('whoami');

// ruleid: exec-use
passthru($user_input);

// ruleid: exec-use
$proc = proc_open($cmd, $descriptorspec, $pipes);

// ruleid: exec-use
$handle = popen($user_input, "r");

// ruleid: exec-use
$output = shell_exec($user_input);

// ruleid: exec-use
$output = system($user_input, $retval);

// ruleid: exec-use
pcntl_exec($path);
