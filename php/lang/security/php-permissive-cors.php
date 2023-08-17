<?php
namespace testing;

// ruleid: php-permissive-cors
header("Access-Control-Allow-Origin: *");

// ruleid: php-permissive-cors
header("Access-Control-Allow-Origin:* ");

// ruleid: php-permissive-cors
Header("access-control-allow-origin: *");

// ok: php-permissive-cors
header("Access-Control-Allow-Origin: *something*");

// ok: php-permissive-cors
header("Other-Property: *");
