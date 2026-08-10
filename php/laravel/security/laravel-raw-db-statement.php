<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

function vulnerable_statement(Request $request) {
    $table = $request->input('table');

    // ruleid: laravel-raw-db-statement
    DB::statement("DROP TABLE " . $table);
}

function vulnerable_select(Request $request) {
    $name = $request->input('name');

    // ruleid: laravel-raw-db-statement
    DB::select("SELECT * FROM users WHERE name = '$name'");
}

function vulnerable_raw(Request $request) {
    $column = $request->input('sort');

    // ruleid: laravel-raw-db-statement
    DB::raw("ORDER BY " . $column);
}

function vulnerable_insert(Request $request) {
    $value = $request->input('value');

    // ruleid: laravel-raw-db-statement
    DB::insert("INSERT INTO logs (entry) VALUES ('$value')");
}

function vulnerable_superglobal() {
    $id = $_GET['id'];

    // ruleid: laravel-raw-db-statement
    DB::select("SELECT * FROM users WHERE id = " . $id);
}

function safe_parameterized(Request $request) {
    $name = $request->input('name');

    // ok: laravel-raw-db-statement
    DB::select("SELECT * FROM users WHERE name = ?", [$name]);
}

function safe_statement_parameterized(Request $request) {
    $id = $request->input('id');

    // ok: laravel-raw-db-statement
    DB::statement("UPDATE users SET active = 1 WHERE id = ?", [$id]);
}

function safe_static_query() {
    // ok: laravel-raw-db-statement
    DB::select("SELECT * FROM users WHERE active = 1");
}

function safe_cast(Request $request) {
    $id = (int) $request->input('id');

    // ok: laravel-raw-db-statement
    DB::select("SELECT * FROM users WHERE id = " . $id);
}
?>
