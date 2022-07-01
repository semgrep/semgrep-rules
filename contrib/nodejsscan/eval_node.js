var express = require('express');
var app = express();
app.get('/', function (req, res) {
    // ruleid:eval_nodejs
    var resp = eval("(" + req.query.name + ")");
    // ruleid:eval_nodejs
    var z = new Function('arg1', 'arg2', req.query.name)
    z(1, 2);
    // ruleid:eval_nodejs
    setTimeout('alert(' + req.body.name, 0);
    // ruleid:eval_nodejs
    setInterval(req.body.name, 0);
    res.send('Response</br>');
});
app.listen(8000);
// ok:eval_nodejs
eval("outside_express" + req.foo)
// ok:eval_nodejs
setTimeout('alert(' + req.body.name, 0);
// ok:eval_nodejs
setInterval(req.body.name, 0);
// ok:eval_nodejs
new Function('arg1', 'arg2', req.query.name)
