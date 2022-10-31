<?php

    //ruleid: php-ssrf
    function test1(){
        $ch = curl_init($_GET['r']);
    }

    //ruleid: php-ssrf
    function test2(){
        $url = $_GET['r'];
        $ch = curl_init($url);
    }

    //ruleid: php-ssrf
    function test3(){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $_POST['image_url']);
    }

    //ruleid: php-ssrf
    function test4(){
        $ch = curl_init();
        $url = $_GET['r'];
        curl_setopt($ch, CURLOPT_URL, $url);
    }

    //ruleid: php-ssrf
    function test5(){
        $url = $_GET['r'];
        $file = fopen($url, 'rb');
    }

    //ruleid: php-ssrf
    function test6(){
        $file = fopen($_POST['r'], 'rb');
    }

    //ruleid: php-ssrf
    function test7(){
        $url = $_POST['r'];
        $file = file_get_contents($url);
    }

    //ruleid: php-ssrf
    function test8(){
        $file = file_get_contents($_POST['r']);
    }

    //ok: php-ssrf
    function test9(){
        $file = file_get_contents("index.php");
    }

    //ok: php-ssrf
    function test10(){
        $url = $_POST['r'];
        $file = fopen("/tmp/test.txt", 'rb');
    }

?>
