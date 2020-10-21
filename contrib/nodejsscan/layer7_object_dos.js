const express = require('express');
const router = express.Router()


router.post("/list-users", (req, res) => {
    var obj = req.body.users;
    var someArr = [];

    // Potential DoS if obj.length is large.
    // ruleid:layer7_object_dos
    for (var i = 0; i < obj.length; i++) {
        someArr.push(obj[i]);
    }

});


module.exports = router


app.post("/foo", (req, res) => {
    var obj = req.body;

    var ret = [];

    // Potential DoS if obj.length is large.
    // ruleid:layer7_object_dos
    for (var i = 0; i < obj.length; i++) {
        ret.push(obj[i]);
    }
});
