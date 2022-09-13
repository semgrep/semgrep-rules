<?php

$tainted = $_GET['userinput'];

// ruleid: assert-use
assert($tainted);

// ok: assert-use
assert('2 > 1');

// todook: assert-use
assert($tainted > 1);

Route::get('bad', function ($name) {
  // ruleid: assert-use
  assert($name);

  // ok: assert-use
  assert('2 > 1');

  // todook: assert-use
  assert($name > 1);
});
