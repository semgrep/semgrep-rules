<?php

$ch = curl_init();

curl_setopt($ch, CURLOPT_URL, "http://www.example.com/");
curl_setopt($ch, CURLOPT_HEADER, 0);

// ruleid: curl-ssl-verifypeer-off
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

// ok: curl-ssl-verifypeer-off
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
