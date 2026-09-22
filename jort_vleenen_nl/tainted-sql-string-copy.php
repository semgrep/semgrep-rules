<?php

// True Positives

function tp1() {
    // ruleid: tainted-sql-string
    $query = "SELECT * FROM table WHERE Id = '".$_GET['url']."'";
    $info = mysql_query($query);
    return $info;
}

function tp2() {
    $part = $_POST['url'];
    // ruleid: tainted-sql-string
    $query = "SELECT * FROM table WHERE Id = '$part'";
    $info = mysql_query($query);
    return $info;
}

function tp3() {
    // ruleid: tainted-sql-string
    $query = "SELECT * FROM table WHERE Id = '{$_REQUEST['url']}'";
    $info = mysql_query($query);
    return $info;
}

function tp4() {
    // ruleid: tainted-sql-string
    $query = sprintf("SELECT * FROM table WHERE Id = '%s'", $_COOKIE['foo']);
    $info = mysql_query($query);
    return $info;
}

function tp5() {
    // ruleid: tainted-sql-string
    $query = "
    SELECT * FROM table WHERE Id = '".$_GET['url']."'";
    $info = mysql_query($query);
    return $info;
}

function tp6_partial_sanitisation() {
    // Only part of the expression is sanitised; tainted data from 'name' still flows
    $id = intval($_GET['id']);
    $name = $_GET['name'];
    // ruleid: tainted-sql-string
    $query = "SELECT * FROM users WHERE id = $id AND name = '$name'";
    return mysql_query($query);
}

function tp7_filter_var_not_used() {
    // Validation result is ignored; tainted value is used directly
    $raw = $_GET['id'];
    $validated = filter_var($raw, FILTER_VALIDATE_INT);
    // ruleid: tainted-sql-string
    $query = "SELECT * FROM users WHERE id = $raw";
    return mysql_query($query);
}

// True Negatives

function tn1() {
    // ok: tainted-sql-string
    $query = 'SELECT * FROM table WHERE Id = 1';
    $info = mysql_query($query);
    return $info;
}

function tn2() {
    $value = 1;
    // ok: tainted-sql-string
    $query = "SELECT * FROM table WHERE Id = '".$value."'";
    $info = mysql_query($query);
    return $info;
}

function tn3() {
    // ok: tainted-sql-string
    $query = "SELECT * FROM table WHERE Id = '{$foobar() ? 1 : 2}'";
    $info = mysql_query($query);
    return $info;
}

function tn4() {
    $value = 1;
    // ok: tainted-sql-string
    $query = sprintf("SELECT * FROM table WHERE Id = '%s'", $value);
    $info = mysql_query($query);
    return $info;
}

function tn5() {
    $part = $_POST['url'];
    $part = mysqli_real_escape_string($part);
    // ok: tainted-sql-string
    $query = sprintf("SELECT * FROM table WHERE Id = '" . $part . "'");
    $info = mysql_query($query);
    return $info;
}

function tn6_ok_delete_non_sql_string() {
    // ok: tainted-sql-string
    $this->delete("id:".$_GET['id']);
}

function tn7_ok_non_sql_context() {
    // ok: tainted-sql-string
    $select = "Foobar: = '{$_REQUEST['url']}'";
    $info = do_smth($select);
    return $info;
}

function tn8_intval_in_numeric_context() {
    $id = intval($_GET['id']);
    // ok: tainted-sql-string
    $query = "SELECT * FROM users WHERE id = $id";
    return mysql_query($query);
}

function tn9_int_cast_in_numeric_context() {
    $id = (int) $_GET['id'];
    // ok: tainted-sql-string
    $query = "SELECT * FROM users WHERE id = $id";
    return mysql_query($query);
}

function tn10_floatval_price() {
    $price = floatval($_GET['price']);
    // ok: tainted-sql-string
    $query = "SELECT * FROM products WHERE price > $price";
    return mysql_query($query);
}

function tn11_filter_var_int() {
    $id = filter_var($_GET['id'], FILTER_VALIDATE_INT);
    // ok: tainted-sql-string
    $query = "SELECT * FROM users WHERE id = $id";
    return mysql_query($query);
}

function tn12_filter_var_float() {
    $amount = filter_var($_POST['amount'], FILTER_VALIDATE_FLOAT);
    // ok: tainted-sql-string
    $query = "SELECT * FROM payments WHERE amount > $amount";
    return mysql_query($query);
}

function tn13_intval_then_string_with_quotes() {
    $id = intval($_GET['id']);
    // ok: tainted-sql-string
    $query = "SELECT * FROM users WHERE id = '$id'";
    return mysql_query($query);
}

function tn14_int_sanitised_and_escaped_name() {
    $id = (int) $_GET['id'];
    $name = mysqli_real_escape_string($_GET['name']);
    // ok: tainted-sql-string
    $query = "SELECT * FROM users WHERE id = $id AND name = '$name'";
    return mysql_query($query);
}
