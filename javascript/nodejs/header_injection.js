var server = http.createServer(function (req, res) {
    var bla = 'dsdsd';
    switch (testIndex++) {
        case 0:
            // ruleid: generic_header_injection
            res.writeHead(200, { test: 'foo \r\ninvalid: bar' + req.foo });
            break;
        case 1:
            // ruleid: generic_header_injection
            res.writeHead(200, { test: req.foo + 'foo \ninvalid: bar' });
            break;
        case 2:
            // ruleid: generic_header_injection
            res.writeHead(200, { test: 'foo \rinvalid: bar' + req.foo + 'asdadasd', foo: bar });
            break;
        case 3:
            // sgrep can't detect this!
            // ruleid: generic_header_injection
            res.writeHead(200, { test: bla + 'foo \n\n\ninvalid: bar' + req.foo });
            break;
        case 4:
            // ruleid: generic_header_injection
            res.writeHead(200, { test: req.foo });
            server.close();
            break;
        default:
            assert(false);
    }
    res.end('Hi mars!');
});
server.listen(common.PORT);