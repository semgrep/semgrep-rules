<?php

// True Positives

function test1() {
    // ruleid: tainted-sql-string
    $query = "SELECT * FROM table WHERE Id = '".$_GET['url']."'";
    $info = mysql_query($query);
    return $info;
}

function test2() {
    $part = $_POST['url'];
    // ruleid: tainted-sql-string
    $query = "SELECT * FROM table WHERE Id = '$part'";
    $info = mysql_query($query);
    return $info;
}

function test3() {
    // ruleid: tainted-sql-string
    $query = "SELECT * FROM table WHERE Id = '{$_REQUEST['url']}'";
    $info = mysql_query($query);
    return $info;
}

function test4() {
    // ruleid: tainted-sql-string
    $query = sprintf("SELECT * FROM table WHERE Id = '%s'", $_COOKIE['foo']);
    $info = mysql_query($query);
    return $info;
}

// True Negatives

function test1() {
    // ok: tainted-sql-string
    $query = 'SELECT * FROM table WHERE Id = 1';
    $info = mysql_query($query);
    return $info;
}

function test2() {
    $value = 1;
    // ok: tainted-sql-string
    $query = "SELECT * FROM table WHERE Id = '".$value."'";
    $info = mysql_query($query);
    return $info;
}

function test3() {
    // ok: tainted-sql-string
    $query = "SELECT * FROM table WHERE Id = '{$foobar() ? 1 : 2}'";
    $info = mysql_query($query);
    return $info;
}

function test4() {
    $value = 1;
    // ok: tainted-sql-string
    $query = sprintf("SELECT * FROM table WHERE Id = '%s'", $value);
    $info = mysql_query($query);
    return $info;
}

function test5() {
    $part = $_POST['url'];
    $part = mysqli_real_escape_string($part);
    // ok: tainted-sql-string
    $query = sprintf("SELECT * FROM table WHERE Id = '" . $part . "'");
    $info = mysql_query($query);
    return $info;
}

function ok_test6() {
    // ok: tainted-sql-string
    $this->delete("id:".$_GET['id']);
}

function ok_test7() {
    // ok: tainted-sql-string
    $select = "Foobar: = '{$_REQUEST['url']}'";
    $info = do_smth($select);
    return $info;
}
