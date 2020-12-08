<?php

// ruleid: mb-ereg-replace-eval
mb_ereg_replace($pattern, $replacement, $string, $user_input_options);

// ok: mb-ereg-replace-eval
mb_ereg_replace($pattern, $replacement, $string, "msr");

// ok: mb-ereg-replace-eval
mb_ereg_replace($pattern, $replacement, $string);
