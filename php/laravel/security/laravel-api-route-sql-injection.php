<?php
// https://www.cloudways.com/blog/laravel-security/
Route::get('this-is-prone-to-sql-injection', function($name) {
return DB::select(
// ruleid: laravel-api-route-sql-injection
DB::raw("SELECT * FROM users WHERE name = $name"));
});

Route::get('this-is-also-prone-to-sql-injection', function($name) {
return DB::select(
// ruleid: laravel-api-route-sql-injection
DB::raw("SELECT * FROM users WHERE name = " . $name));
});

Route::get('this-is-prone-to-sql-injection-too', function($name) {
return DB::select(
// ruleid: laravel-api-route-sql-injection
DB::raw("SELECT * FROM users WHERE name = $name AND someproperty = foo"));
});

Route::get('safe-from-sql-injection', function($name) {
return DB::select(
// ok: laravel-api-route-sql-injection
DB::raw("SELECT * FROM users WHERE name = ?", [$name]));
});
?>
