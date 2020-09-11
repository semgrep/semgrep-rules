function test1() {
    // ruleid: xxe_sax
    var sax = require("sax"),
        strict = false,
        parser = sax.parser(strict);

    parser.onattribute = function (attr) {
        doSmth(attr)
    };

    parser.ondoctype = function (dt) {
        processDocType(dt)
    }

    const xml = `<?xml version="1.0" encoding="ISO-8859-1"?>
    <!DOCTYPE foo [
    <!ENTITY xxe SYSTEM "file:///etc/passwd" >]>
    <username>&xxe;</username>`;

    parser.write(xml).close();
}

function test2() {
    // ruleid: xxe_sax
    var saxStream = require("sax").createStream(strict, options)

    saxStream.on("opentag", function (node) {
        // same object as above
    })

    saxStream.on("doctype", function (node) {
        processType(node)
    })

    fs.createReadStream("file.xml")
        .pipe(saxStream)
        .pipe(fs.createWriteStream("file-copy.xml"))
}