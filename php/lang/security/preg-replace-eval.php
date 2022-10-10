<?php

// ruleid: preg-replace-eval
preg_replace($user_input_pattern, $replacement, $string);

// ok: preg-replace-eval
preg_replace("/some_regexp/", "replacement", $string_before);

// ok: preg-replace-eval
preg_replace(array("/hello/"), array("world"), "hello world");

$input = array("/constant/");
// ok: preg-replace-eval
preg_replace($input, array("world"), "hello world");

