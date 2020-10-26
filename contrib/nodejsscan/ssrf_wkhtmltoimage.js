var wkhtmltoimage = require('wkhtmltoimage')

// ok: wkhtmltoimage_ssrf
wkhtmltoimage.generate(input(), { output: 'vuln.jpg' })

function test(userInput) {
    // ok: wkhtmltoimage_ssrf
    wkhtmltoimage.generate(userInput, { output: 'vuln.jpg' })
}


app.get('/', function (req, res) {

    // ruleid:wkhtmltoimage_ssrf
    wkhtmltoimage.generate(req.foo, { output: 'vuln.jpg' })


});
