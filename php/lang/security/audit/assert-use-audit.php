<?php

// ruleid: assert-use-audit
assert($user_input);

// ok: assert-use-audit
assert('2 > 1');

// ok: assert-use-audit
assert($user_input > 1);

// ok: assert-use-audit
assert($ok < 1 || $ok > 2);

// ok: assert-use-audit
assert($ok != "something");

// ok: assert-use-audit
assert($ok instanceof FakeClass);