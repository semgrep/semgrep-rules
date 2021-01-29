var handlebars = require('handlebars'),
    fs = require('fs'),
    Sqrl = require('squirrelly');
// do not match
var template = handlebars.compile(source);

app.get('/', function (req, res) {
    var storeName = "console.log(process.pid)" // this should be a user-controlled string
    function getStoreName() {
        return storeName;
    }
    var scope = {
        getStoreName: getStoreName
    }

    fs.readFile('example.html', 'utf-8', function (error, source) {
        // ruleid:server_side_template_injection
        var template = handlebars.compile(source + req.foo);
        // ruleid:server_side_template_injection
        handlebars.compile(source + req.foo.bar);


        var myTemplate = 'Hi, my name is {{name}}'
        // ruleid:server_side_template_injection
        var temp = myTemplate + req.foo['bar']
        var compiled = Sqrl.Compile(temp)


        // ruleid:server_side_template_injection
        var xx = source.replace('<!-->', req.foo)
        handlebars.compile(xx)


        // ruleid:server_side_template_injection
        var x = source + req.foo;
        var z = 2;
        handlebars.compile(x);

        var html = template(data);
        console.log(html)
    });

    //do not match
    var template = handlebars.compile(source);
});
