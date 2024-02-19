<?php

$command = $secret = $counter = $uid = $totalColors = $i = $row = $value = $numeric = $string = '1';
$getRandomNumber = 'rand';

// ok: base-convert-loses-precision
var_dump(base_convert("0775", 8, 10));

// ruleid: base-convert-loses-precision
$token = base_convert(bin2hex(hash('sha256', uniqid(mt_rand(), true), true)), 16, 36);

// ruleid: base-convert-loses-precision
base_convert(hash_hmac('sha256', $command . ':' . $token, $secret), 16, 36);

// ruleid: base-convert-loses-precision
$randString = base_convert(sha1(uniqid(mt_rand(), true)), 16, 36);

// ok: base-convert-loses-precision
$token = 'gleez_profiler/'.base_convert($counter++, 10, 32);

// ok: base-convert-loses-precision
$color1Index = base_convert(substr($uid, 0, 2), 16, 10) % $totalColors;

// ruleid: base-convert-loses-precision
$uniqueId = substr(base_convert(md5(uniqid(rand(), true)), 16, 36), 1, 20);

// ruleid: base-convert-loses-precision
$token = base_convert(sha1($i),7, 36);

// ok: base-convert-loses-precision
$id_converted = base_convert($row, 10, 36);

// ok: base-convert-loses-precision
$value = base_convert(substr($value, 2), 16, 10);

// ok: base-convert-loses-precision
base_convert(rand(1, 1000000000), 10, 36);

// ruleid: base-convert-loses-precision
$salt = base_convert(bin2hex(random_bytes(20)), 16, 36);

// taking only 7 hex chars makes it fit into a 64-bit integer
$stringHash = substr(md5($string), 0, 7);
// ok: base-convert-loses-precision
base_convert($stringHash, 16, 10);

$stringHash = substr(md5($string), 0, 8);
// ruleid: base-convert-loses-precision
base_convert($stringHash, 16, 10);

// ruleid: base-convert-loses-precision
$seed = base_convert(md5(microtime().$_SERVER['DOCUMENT_ROOT']), 16, $numeric ? 10 : 35);

$bytes = random_bytes(32);
// ruleid: base-convert-loses-precision
base_convert(bin2hex($bytes), 16, 36);

// ruleid: base-convert-loses-precision
$salt = base_convert(bin2hex(random_bytes(20)), 16, 36);

// ruleid: base-convert-loses-precision
base_convert(bin2hex(hash('sha256', uniqid(mt_rand(), true), true)), 16, 36);

// ruleid: base-convert-loses-precision
base_convert(bin2hex(openssl_random_pseudo_bytes(8)), 16, 36);

// hard to say whether this is OK or not
base_convert(bin2hex($getRandomNumber()), 16, 36);

// ok: base-convert-loses-precision
base_convert(bin2hex(iconv('UTF-8', 'UCS-4', $m)), 16, 10);

// ruleid: base-convert-loses-precision
$salt = base_convert(bin2hex($this->security->get_random_bytes(20)), 16,36);

// ok: base-convert-loses-precision
$currentByteBits = str_pad(base_convert(bin2hex(fread($fp,1)), 16, 2),8,'0',STR_PAD_LEFT);

// ok: base-convert-loses-precision
base_convert(bin2hex(random_bytes(7)), 16, 36);