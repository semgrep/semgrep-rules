const wkhtmltopdf = require('wkhtmltopdf')

// ok:wkhtmltopdf_ssrf_warning
wkhtmltopdf(input(), { output: 'vuln.pdf' })

function test(userInput) {
    // ok:wkhtmltopdf_ssrf_warning
    return wkhtmltopdf(userInput, { output: 'vuln.pdf' })
}


app.get('/', function (req, res) {
    // ok:wkhtmltopdf_ssrf
    wkhtmltopdf('<html><html/>', { output: 'vuln.pdf' })
    // ruleid:wkhtmltopdf_ssrf
    wkhtmltopdf(req.foo, { output: 'vuln.pdf' })

});
