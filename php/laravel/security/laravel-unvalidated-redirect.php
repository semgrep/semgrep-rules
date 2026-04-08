<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;

function vulnerable_redirect_input(Request $request) {
    $url = $request->input('redirect_url');

    // ruleid: laravel-unvalidated-redirect
    return redirect($request->input('redirect_url'));
}

function vulnerable_redirect_get(Request $request) {
    // ruleid: laravel-unvalidated-redirect
    return redirect($request->get('url'));
}

function vulnerable_redirect_query(Request $request) {
    // ruleid: laravel-unvalidated-redirect
    return redirect($request->query('next'));
}

function vulnerable_facade_redirect(Request $request) {
    // ruleid: laravel-unvalidated-redirect
    return Redirect::to($request->input('url'));
}

function vulnerable_redirect_to(Request $request) {
    // ruleid: laravel-unvalidated-redirect
    return redirect()->to($request->get('return_url'));
}

function vulnerable_superglobal() {
    // ruleid: laravel-unvalidated-redirect
    return redirect($_GET['url']);
}

function vulnerable_post_superglobal() {
    // ruleid: laravel-unvalidated-redirect
    return Redirect::to($_POST['redirect']);
}

function safe_static_redirect() {
    // ok: laravel-unvalidated-redirect
    return redirect('/dashboard');
}

function safe_route_redirect() {
    // ok: laravel-unvalidated-redirect
    return redirect()->route('home');
}

function safe_intended_redirect() {
    // ok: laravel-unvalidated-redirect
    return redirect()->intended('/dashboard');
}

function safe_back_redirect() {
    // ok: laravel-unvalidated-redirect
    return redirect()->back();
}
?>
