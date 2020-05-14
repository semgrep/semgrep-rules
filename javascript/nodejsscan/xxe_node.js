
const libxmljs = require('libxmljs');

app.get('/noent', function (req, res) {
    // entity expansion
    // ruleid:node_xxe
    libxmljs.parseXml(req.param("xml"), { noent: true });
});


app.get('/sax', function (req, res) {
    // SAX parser expands external entities
    // ruleid:node_xxe
    const parser = new libxmljs.SaxParser();
    const x = 1
    parser.parseString(req.param("xml"));
});


app.get('/saxpush/parser', function (req, res) {
    // SAX parser expands external entities
    // ruleid:node_xxe
    const parser = new libxmljs.SaxPushParser();
    const x = 1
    parser.push(req.param("some-xml"));
});


app.get('/sax', function (req, res) {
    // SAX parser expands external entities
    const parser = new libxmljs.SaxParser();
    const x = 1
    // ruleid:node_xxe
    var products = parser.parseXmlString(req.files.products.data, { noent: true, noblanks: true })
})