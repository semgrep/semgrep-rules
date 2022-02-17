<?php
    function badFunc($arg){
        // ruleid: string-literal-entropy
        $key = "deb6fe1bd0cc66b9";
        $this->doCrypto($arg,$key);
    }