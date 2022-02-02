<?php

class OpenSslTest{
    public static function decrypt_test_1($crypt, $ky) {
        $key   = html_entity_decode($ky);
        $iv = "@@@@&&&&####$$$$";

        // ruleid: openssl-decrypt-validate
        $data = openssl_decrypt ( $crypt , "AES-128-CBC" , $key, 0, $iv );
        return $data;
    }

    public static function decrypt_test_2($crypt, $ky) {
        $key   = html_entity_decode($ky);
        $iv = "@@@@&&&&####$$$$";

        // ruleid: openssl-decrypt-validate
        $data = openssl_decrypt ( $crypt , "AES-128-CBC" , $key, 0, $iv );
        if($data == true){
            return "";
        }

        return $data;
    }

    public static function decrypt_test_3($crypt, $ky) {
        $key   = html_entity_decode($ky);
        $iv = "@@@@&&&&####$$$$";

        // ruleid: openssl-decrypt-validate
        return openssl_decrypt ( $crypt , "AES-128-CBC" , $key, 0, $iv );
    }

    public static function decrypt_test_ok($crypt, $ky) {
        $key   = html_entity_decode($ky);
        $iv = "@@@@&&&&####$$$$";

        // ok: openssl-decrypt-validate
        $data = openssl_decrypt ( $crypt , "AES-128-CBC" , $key, 0, $iv );
        if($data == false){
            return "";
        }

        return $data;
    }

    public static function decrypt_test_ok_2($crypt, $ky) {
        $key   = html_entity_decode($ky);
        $iv = "@@@@&&&&####$$$$";

        // ok: openssl-decrypt-validate
        $data = openssl_decrypt ( $crypt , "AES-128-CBC" , $key, 0, $iv );
        if(false === $data){
            return "";
        }

        return $data;
    }

    public static function decrypt_test_ok_3($crypt, $ky) {
        $key   = html_entity_decode($ky);
        $iv = "@@@@&&&&####$$$$";
    
        // ok: openssl-decrypt-validate
        $data = openssl_decrypt ( $crypt , "AES-128-CBC" , $key, 0, $iv );
        assertTrue(false !== $data);

        return $data;
    }
}
