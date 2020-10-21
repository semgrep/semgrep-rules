var session = require('express-session')
var express = require('express')
var app = express()

function test1() {
    var expiryDate = new Date(Date.now() + 60 * 60 * 1000) // 1 hour
    var opts = {
        keys: ['key1', 'key2'],
        cookie: {
            secure: true,
            sameSite: 'strict',
            httpOnly: true,
            domain: 'example.com',
            path: 'foo/bar',
            expires: expiryDate
        }
    }
    // ruleid:cookie_session_default
    app.use(session(opts))
}

function test2() {
    // ruleid:cookie_session_no_secure
    app.use(session(Object.assign({
        keys: ['key1', 'key2'],
        name: 'foo'
    }, {
        cookie: {
            httpOnly: true,
            sameSite: true,
            domain: 'example.com',
            path: 'foo/bar',
            expires: new Date(Date.now() + 60 * 60 * 1000)
        }
    })))
}

function test3() {
    // ruleid:cookie_session_no_httponly
    app.use(session({
        keys: ['key1', 'key2'],
        name: 'foo',
        cookie: {
            secure: true,
            sameSite: 'lax',
            domain: 'example.com',
            path: 'foo/bar',
            expires: new Date(Date.now() + 60 * 60 * 1000)
        }
    }))
}

function test4() {
    var opts = {
        keys: ['key1', 'key2'],
        name: 'foo',
    }

    if (app.get('env') === 'production') {
        app.set('trust proxy', 1) // trust first proxy
        opts.cookie = {
            secure: true,
            sameSite: 'strict',
            httpOnly: true,
            path: 'foo/bar',
            expires: new Date(Date.now() + 60 * 60 * 1000)
        }
    }
    // ruleid:cookie_session_no_domain
    app.use(session(opts))
}

function test5() {
    var expiryDate = new Date(Date.now() + 60 * 60 * 1000) // 1 hour
    var opts = {
        keys: ['key1', 'key2'],
        name: 'foo',
        cookie: {
            secure: true,
            sameSite: 'strict',
            httpOnly: true
        }
    }

    if (app.get('env') === 'production') {
        app.set('trust proxy', 1) // trust first proxy
        opts.cookie.domain = 'example.com'
        opts.cookie.expires = expiryDate
    }

    // ruleid:cookie_session_no_path
    app.use(session(opts))
}

function test6() {
    var opts = {
        keys: ['key1', 'key2'],
        name: 'foo',
        cookie: {
            secure: true,
            sameSite: 'strict',
            httpOnly: true,
            domain: 'example.com',
            path: 'foo/bar'
        }
    }

    // ruleid:cookie_session_no_expires
    app.use(session(opts))
}

function samestite() {
    var expiryDate = new Date(Date.now() + 60 * 60 * 1000) // 1 hour
    var opts = {
        keys: ['key1', 'key2'],
        name: 'foo',
        cookie: {
            secure: true,
            httpOnly: true,
            sameSite: 'none',
            domain: 'example.com',
            path: 'foo/bar',
            expires: expiryDate
        }
    }

    // ruleid:cookie_session_no_samesite
    app.use(session(opts))
}
