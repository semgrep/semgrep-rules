<?php

$foo = [2, 1, 3];

// ok: tainted-callable
var_dump(usort($foo, 'strcmp'));

// ok: tainted-callable
var_dump(usort($_GET['array'], 'strcmp'));

// ruleid: tainted-callable
var_dump(usort($foo, $_GET['sortfunc']));
