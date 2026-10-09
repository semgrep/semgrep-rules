<?php

use Illuminate\Support\Facades\Hash;

function vulnerable_md5_password($password) {
    // ruleid: laravel-weak-password-hash
    $hashed = md5($password);
    return $hashed;
}

function vulnerable_sha1_password($user_password) {
    // ruleid: laravel-weak-password-hash
    $hashed = sha1($user_password);
    return $hashed;
}

function vulnerable_crypt_md5_password($password) {
    // ruleid: laravel-weak-password-hash
    $hashed = crypt($password, '$1$saltsalt$');
    return $hashed;
}

function vulnerable_crypt_sha256_password($password) {
    // ruleid: laravel-weak-password-hash
    $hashed = crypt($password, '$5$rounds=5000$saltsaltsalt$');
    return $hashed;
}

function safe_crypt_bcrypt($password) {
    // ok: laravel-weak-password-hash
    $hashed = crypt($password, '$2y$10$abcdefghijklmnopqrstuu');
    return $hashed;
}

function vulnerable_md5_pass($pass) {
    // ruleid: laravel-weak-password-hash
    $hashed = md5($pass);
    return $hashed;
}

function safe_hash_make($password) {
    // ok: laravel-weak-password-hash
    $hashed = Hash::make($password);
    return $hashed;
}

function safe_bcrypt($password) {
    // ok: laravel-weak-password-hash
    $hashed = bcrypt($password);
    return $hashed;
}

function safe_md5_non_password($email) {
    // ok: laravel-weak-password-hash
    $gravatar = md5($email);
    return $gravatar;
}

function safe_sha1_non_password($filename) {
    // ok: laravel-weak-password-hash
    $hash = sha1($filename);
    return $hash;
}
?>
