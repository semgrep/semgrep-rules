var express = require('express');
var app = express();
app.get('/view/:id', function (req, res) {

    // ruleid:node_logic_bypass
    if (req.cookies["user"] === req.params["id"]) {
        showProfile();
    }

});
