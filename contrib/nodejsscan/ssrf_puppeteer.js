const express = require('express')
const app = express()
const port = 3000
const puppeteer = require('puppeteer')

app.get('/', async (req, res) => {
    const browser = await puppeteer.launch()
    const page = await browser.newPage()
    // ruleid: puppeteer_ssrf
    const url = `https://${req.query.name}`
    await page.goto(url)

    await page.screenshot({ path: 'example.png' })
    await browser.close()

    res.send('Hello World!')
})

app.post('/test', async (req, res) => {
    const browser = await puppeteer.launch()
    const page = await browser.newPage()
    // ruleid: puppeteer_ssrf
    await page.setContent(`${req.body.foo}`)

    await page.screenshot({ path: 'example.png' })
    await browser.close()

    res.send('Hello World!')
})

const controller = async (req, res) => {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    // ruleid: puppeteer_ssrf
    const body = req.body.foo;
    await page.setContent('<html>' + body + '</html>');

    await page.screenshot({ path: 'example.png' });
    await browser.close();

    res.send('Hello World!');
}

app.post('/test2', async (req, res) => {
    const browser = await puppeteer.launch()
    const page = await browser.newPage()
    // ruleid: puppeteer_ssrf
    await page.evaluateOnNewDocument(`${req.body.foo}`)

    await page.screenshot({ path: 'example.png' })
    await browser.close()

    res.send('Hello World!')
})

const controller2 = async (req, res) => {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    // ruleid: puppeteer_ssrf
    const body = req.body.foo;
    await page.evaluate('alert(' + body + ')');

    await page.screenshot({ path: 'example.png' });
    await browser.close();

    res.send('Hello World!');
}

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))
