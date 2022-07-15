<?php
    // ruleid: laravel-active-debug-code 
    config(['app.debug' => 'true']);

    // ruleid: laravel-active-debug-code 
    putenv("APP_DEBUG=true");

    // ruleid: laravel-active-debug-code 
    $_ENV['APP_DEBUG'] = 'true';

    // ok: laravel-active-debug-code
    config(['app.debug' => 'false']);

    // ok: laravel-active-debug-code
    putenv("APP_DEBUG=false");

    // ok: laravel-active-debug-code 
    $_ENV['APP_DEBUG'] = 'false';

    // this is ok because it retrieves the value from the env file instead of setting it directly.
    // ok: laravel-active-debug-code
    $value = config('app.debug', 'true');
?>
