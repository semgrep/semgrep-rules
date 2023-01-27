<?php

// ruleid: assert-use-audit
assert($user_input);

// ruleid: assert-use-audit
assert($_GET['something']);

// ruleid: assert-use-audit
assert($_POST[$param]);

// ruleid: assert-use-audit
assert($someobj->name);

// ok: assert-use-audit
assert('2 > 1');

// ok: assert-use-audit
assert($user_input > 1);

// ok: assert-use-audit
assert($ok < 1 || $ok > 2);

// ok: assert-use-audit
assert($ok->count < 1 || $ok > 2);

// ok: assert-use-audit
assert($ok != "something");

// ok: assert-use-audit
assert($ok!="something");

// ok: assert-use-audit
assert($ok instanceof FakeClass);

// ok: assert-use-audit
assert($ok[$param] instanceof FakeClass);

// ok: assert-use-audit
assert($ok['foo'] instanceof FakeClass);

// ok: assert-use-audit
assert($ok->property instanceof FakeClass);