<?php

// ruleid: sql_injection
$result = $wpdb->get_var("SELECT meta_value FROM {$wpdb->prefix}table WHERE order_item_id = $order_item_id AND meta_key = $meta_key");

// ruleid: sql_injection
$get_question_options = $wpdb->get_results("SELECT * FROM {$wpdb->prefix}table WHERE question_id = $id ", ARRAY_A);

// ok: sql_injection
$wpdb->prepare("SELECT $column FROM $this->table_name WHERE $this->primary_key = %d LIMIT 1;",(int) $row_id);



?>