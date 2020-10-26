const wkhtmltopdf = require('wkhtmltopdf')

// ruleid: wkhtmltopdf-injection
wkhtmltopdf(input(), { output: 'vuln.pdf' })

function test(userInput) {
  // ruleid: wkhtmltopdf-injection
  return wkhtmltopdf(userInput, { output: 'vuln.pdf' })
}

// ok: wkhtmltopdf-injection
wkhtmltopdf('<html><html/>', { output: 'vuln.pdf' })

function okTest(userInput) {
   var html = '<html><html/>';
   // ok: wkhtmltopdf-injection
   return wkhtmltopdf(html, { output: 'vuln.pdf' })
}
