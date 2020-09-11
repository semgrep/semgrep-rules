function test1() {
    const express = require('express')
    const xml2json = require('xml2json')
    const app = express()
    const port = 3000

    app.get('/', (req, res) => {
        // ruleid: xxe_xml2json
        const xml = req.query.xml
        const content = xml2json.toJson(xml, { coerce: true, object: true });
    })

    app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))
}

function test2() {
    const express = require('express')
    const xml2json = require('xml2json')
    const app = express()
    const port = 3000

    app.get('/', (req, res) => {
        // ruleid: xxe_xml2json
        const content = xml2json.toJson(req.body, { coerce: true, object: true });
    })

    app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))
}
