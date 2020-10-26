const { chromium } = require('playwright');
const express = require('express')
const app = express()
const port = 3000

app.post('/goto', async (req, res) => {
    const browser = await chromium.launch();
    const page = await browser.newPage();
    let url = 'https://hardcoded.url.com'

    // ruleid:playwright_ssrf
    await page.goto(req.foo);

    // ruleid:playwright_ssrf
    const newUrl = req.foo.bar;
    await page.goto(newUrl);

    await page.screenshot({ path: 'example.png' });
    await browser.close();
})

app.post('/setContent', async (req, res) => {
    const browser = await chromium.launch();
    const page = await browser.newPage();


    // ruleid:playwright_ssrf
    await page.setContent(req.foo['bar']);

    await page.screenshot({ path: 'example.png' });
    await browser.close();
})

app.post('/evaluate', async (req, res) => {

    const browser = await chromium.launch();
    const page = await browser.newPage();


    // ruleid:playwright_ssrf
    await page.evaluate(`fetch(${req.foo})`);

    await page.screenshot({ path: 'example.png' });
    await browser.close();
})

app.post('/evaluate', async (req, res) => {

    const browser = await chromium.launch();
    const page = await browser.newPage();


    // ruleid:playwright_ssrf
    await page.evaluate(x => fetch(x), req.foo.bar);

    await page.screenshot({ path: 'example.png' });
    await browser.close();
})
