import express from 'express';
import * as pug from 'pug';
import * as jade from 'jade';
import * as dot from 'dot';
import * as ejs from 'ejs';
import * as nunjucks from 'nunjucks';
import * as lodash from 'lodash';
import * as handlebars from 'handlebars';
import * as mustache from 'mustache';
const Hogan = require("hogan.js");
import * as Eta from 'eta';
import * as Sqrl from 'squirrelly'

var app = express();

app.get('/', function(req, res) {
    let tainted = req.query.id;
    // express-insecure-template-usage
    pug.compile(tainted); 
    // express-insecure-template-usage
    pug.render(tainted); 
    // express-insecure-template-usage
    jade.compile(tainted);
    // express-insecure-template-usage
    jade.render(tainted);
     // express-insecure-template-usage
    dot.template(tainted); 
    // express-insecure-template-usage
    ejs.render(tainted); 
    // express-insecure-template-usage
    nunjucks.renderString(tainted); 
    // express-insecure-template-usage
    lodash.template(tainted); 
    // express-insecure-template-usage
    dot.compile(tainted); 
    // express-insecure-template-usage
    handlebars.compile(req.query.id); 
    // express-insecure-template-usage
    mustache.render(req.body._); 
    // express-insecure-template-usage
    Hogan.compile(tainted); 
    // express-insecure-template-usage
    Eta.render(tainted); 
    // express-insecure-template-usage
    Sqrl.render(tainted); 
});