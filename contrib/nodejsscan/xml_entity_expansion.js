app.get('/expat', function (req, res) {
    // ruleid:node_entity_expansion
    var parser = new expat.Parser();
    parser.write(req.param("xml"));
})
