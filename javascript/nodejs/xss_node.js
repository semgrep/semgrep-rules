var express = require('express');
var app = express();
app.get('/', function (req, res) {
    var resp = req.query.name;
    // ruleid: express_xss
    res.send('Response</br>' + resp);
});
//Sgrep limitation
app.get('/xss', function (req, res) {
    var resp = req.query.name;
    var html = "ASadad" + resp + "Asdadads"
    res.write('Response</br>' + html);
});
app.listen(8000);