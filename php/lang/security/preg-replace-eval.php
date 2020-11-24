<?php

// ruleid: preg-replace-eval
preg_replace($user_input_pattern, $replacement, $string);

// ok: preg-replace-eval
preg_replace("/some_regexp/", "replacement", $string_before);
