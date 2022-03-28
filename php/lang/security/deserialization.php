
<?php

/* Suppose that $var_array is an array returned from
   wddx_deserialize */

$size = "large";
$var_array = array("color" => "blue",
                   "size"  => "medium",
                   "shape" => "sphere");
// ok: extract-user-data
extract($var_array, EXTR_PREFIX_SAME, "wddx");

$bad = $_GET['some_param'];
// ruleid:extract-user-data
extract($bad, EXTR_PREFIX_SAME, "wddx");
echo "$color, $size, $shape, $wddx_size\n";

$bad2 = $_FILES["/some/bad/path"];
// ruleid:extract-user-data
extract($bad2, EXTR_PREFIX_SAME, "wddx");

// ok: extract-user-data
$ok = $_FILES["/some/bad/path"];
extract($ok, EXTR_SKIP, "wddx");
?>
