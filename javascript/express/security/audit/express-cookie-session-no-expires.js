var session = require('express-session')
var express = require('express')
var app = express()

function test1() {
	var expiryDate = new Date(Date.now() + 60 * 60 * 1000) // 1 hour
	var opts = {
	  keys: ['key1', 'key2'],
	  cookie: {
	  	secure: true,
	    httpOnly: true,
	    domain: 'example.com',
	    path: 'foo/bar',
	    expires: expiryDate
	  }
	}
	app.use(session(opts))
}

function test2() {
	app.use(session(Object.assign({
	  keys: ['key1', 'key2'],
	  name: 'foo'
	},{
	  cookie: {
	    httpOnly: true,
	    domain: 'example.com',
	    path: 'foo/bar',
	    expires: new Date(Date.now() + 60 * 60 * 1000)
	  }
	})))
}

function test3() {
	app.use(session({
	  keys: ['key1', 'key2'],
	  name: 'foo',
	  cookie: {
	  	secure: true,
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
	    httpOnly: true,
	    path: 'foo/bar',
	    expires: new Date(Date.now() + 60 * 60 * 1000)
	  }
	}
	app.use(session(opts))
}

function test5() {
	var expiryDate = new Date(Date.now() + 60 * 60 * 1000) // 1 hour
	var opts = {
	  keys: ['key1', 'key2'],
	  name: 'foo',
	  cookie: {
	  	secure: true,
	    httpOnly: true
	  }
	}

	if (app.get('env') === 'production') {
	  app.set('trust proxy', 1) // trust first proxy
	  opts.cookie.domain = 'example.com'
   	    opts.cookie.expires = expiryDate
	}

	app.use(session(opts))
}

function test6() {
	var opts = {
	  keys: ['key1', 'key2'],
	  name: 'foo',
	  cookie: {
	  	secure: true,
	    httpOnly: true,
	    domain: 'example.com',
	    path: 'foo/bar'
	  }
	}

// ruleid: express-cookie-session-no-expires
	app.use(session(opts))
}

function okTest() {
	var expiryDate = new Date(Date.now() + 60 * 60 * 1000) // 1 hour
	var opts = {
	  keys: ['key1', 'key2'],
	  name: 'foo',
	  cookie: {
	  	secure: true,
	    httpOnly: true,
	    domain: 'example.com',
	    path: 'foo/bar',
	    expires: expiryDate
	  }
	}

// ok: express-cookie-session-no-expires
	app.use(session(opts))
}
