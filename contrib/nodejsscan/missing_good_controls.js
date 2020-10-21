app.post('/entry', (req, res) => {
    console.log(`Message received: ${req.body.message}`);
    res.send(`CSRF token not used`);
});

app.post('/auth', function (request, response) {
    var username = request.body.username;
    var password = request.body.password;
    if (username && password) {
        connection.query('SELECT * FROM accounts WHERE username = ? AND password = ?', [username, password], function (error, results, fields) {
            if (results.length > 0) {
                request.session.loggedin = true;
                request.session.username = username;
                response.redirect('/home');
            } else {
                response.send('Incorrect Username and/or Password!');
            }
            response.end();
        });
    } else {
        response.send('Please enter Username and Password!');
        response.end();
    }
});

// missing helmet
const helmet = require('helmet')
const xssFilter = require('x-xss-protection')
const noSniff = require('dont-sniff-mimetype')
const hsts = require('hsts')
const frameguard = require('frameguard')
const permittedCrossDomainPolicies = require('helmet-crossdomain')

app.use(helmet.dnsPrefetchControl({ allow: true }))
app.use(dnsPrefetchControl({ allow: true }))
