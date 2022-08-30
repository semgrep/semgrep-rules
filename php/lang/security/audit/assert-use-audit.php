<?php

// ruleid: assert-use-audit
assert($user_input);

// ok: assert-use-audit
assert('2 > 1');

// todook: assert-use-audit
assert($user_input > 1);
