<?php

if (Configuration::get('PS_SMARTY_CACHING_TYPE') == 'postgresql') {
    print("OK!");
}

if (Configuration::get('PS_SMARTY_CACHING_TYPE') == 'mysql') {
    include _PS_CLASS_DIR_.'Smarty/SmartyCacheResourceMysql.php';
    $smarty->caching_type = 'mysql';
}
