<?php

// ruleid: redirect-to-request-uri
header('Location: '.$_SERVER['REQUEST_URI']);

// ruleid: redirect-to-request-uri
header('location:'.$_SERVER['REQUEST_URI']);

// ruleid: redirect-to-request-uri
header('Location: '.$_SERVER['REQUEST_URI'].'/');

// ruleid: redirect-to-request-uri
header("Location: ".$_SERVER['REQUEST_URI']);

// ruleid: redirect-to-request-uri
header('Location: '.$_SERVER["REQUEST_URI"]);

// ok: redirect-to-request-uri
header('Location: '.$_SERVER['PHP_SELF']);

// ok: redirect-to-request-uri
header('X-Request-Uri: '.$_SERVER['REQUEST_URI']);

// ok: redirect-to-request-uri
header('Location: https://semgrep.dev'.$_SERVER['REQUEST_URI']);

// ok: redirect-to-request-uri
header('Location: '.$BASE_URL.$_SERVER['REQUEST_URI']);

// ok: redirect-to-request-uri
header('Location: '.$SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);

// ok: redirect-to-request-uri
header('Location: /foo');
