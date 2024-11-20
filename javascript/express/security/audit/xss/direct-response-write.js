
const express = require('express')
const router = express.Router()
var xss = require("xss");

import {
    AdminUpdateUserAttributesCommand,
    CognitoIdentityProviderClient,
} from "@aws-sdk/client-cognito-identity-provider";


router.get('/greeting', (req, res) => {
    const { name } = req.query;
    // ruleid: direct-response-write
    res.send('<h1> Hello :' + name + "</h1>")
})

//template handle escaping
router.get('/greet-template', (req, res) => {
    name = req.query.name
    // ok: direct-response-write
    res.render('index', { user_name: name });
})

//template handle escaping
router.get('/greet-template', (req, res) => {
    a = req.query.name
    // ok: direct-response-write
    res.send('<h1> Hello :' + xss(a) + "</h1>")
})


module.exports = router


app.get('/', function (req, res) {
    var user = req.query.name;

    msg = "Hi " + user
    // ruleid: direct-response-write
    res.send('Response</br>' + msg);
});


var msg = '';
app.get('/3', function (req, res) {
    var user = req.query.name;

    msg = "Hi " + user
    // ruleid: direct-response-write
    res.send('Response</br>' + msg);
});

app.get('/2', function (req, res) {
    var user = { user: req.query.name };
    // ruleid: direct-response-write
    res.send('Response</br>' + user.user);
});


app.get('/4', function (req, res) {
    var user = req.query.name;
    var header = "<html>";
    var msg = 'Hi ' + user;
    var footer = "</html>";
    var output = header + msg + footer;
    // ruleid: direct-response-write
    res.send(output);
});

app.get('/4', function (req, res) {
    var user = req.query.name;
    var header = "<html>";
    var msg = 'Hi ' + user;
    var footer = "</html>";
    var output = header + msg + footer;
    // ok: direct-response-write
    res.type('xml').set('Content-Length', Buffer.byteLength(xml)).send(xml);
});

var express = require('express');
var app = express();
app.get('/', function (req, res) {
    var resp = req.query.name;
    // ruleid: direct-response-write
    res.send('Response</br>' + resp);
});
app.get('/3', function (req, res) {
    var resp = req.query.name;
    // ruleid: direct-response-write
    res.write('Response</br>' + resp);
});

app.get('/3', function (req, res) {
    var resp = req.foo;
    var x = 1;
    // ok: direct-response-write
    res.write('Response</br>' + resp);
});

app.get('/xss', function (req, res) {
    var html = "ASadad" + req.query.name + "Asdadads"
    // ruleid: direct-response-write
    res.write('Response</br>' + html);
});
app.get('/xss', function (req, res) {
    // ruleid: direct-response-write
    res.write('Response</br>' + req.query('doo'));
});
app.get('/xss', function (req, res) {
    // ok: direct-response-write
    res.set('Content-Type','text/plain')
    res.write('Response</br>' + req.query.name);
});

app.get('/noxss', function (req, res) {
    var resp = req.query.name;
    // ok: direct-response-write
    res.write('Response</br>');
});

app.get('/noxs2s', function (req, res) {
    var resp = req.query.name;
    // ruleid: direct-response-write
    res.write('Response</br>' + resp);
});

app.get('/xss', function (req, res) {
    var resp = req.query.name;
    var html = "ASadad" + resp + "Asdadads"
    // ruleid: direct-response-write
    res.write('Response</br>' + html);
});

const jsonRouter = express.Router();
jsonRouter.use(express.json());
jsonRouter.get('/noxss-json', function (req, res) {
    var name = req.query.name;
    // ok: direct-response-write
    res.write({ name });
});
app.use(jsonRouter);

// For https://github.com/returntocorp/semgrep-rules/issues/2872
app.post(
    "/:id",
    async (req, res, next) => {
        const userId = req.params?.id;

        if (user.email !== req.body.email) {
            const command = new AdminUpdateUserAttributesCommand({
                Username: user.cognitoUserId,
                UserPoolId: process.env.COGNITO_USER_POOL_ID,
                UserAttributes: [
                    {
                        Name: "email",
                        Value: req.body.email,
                    }
                ],
            });

            // ok: direct-response-write
            await client.send(command);
        }

        res.status(200).send();
    }
);


app.listen(8000);

