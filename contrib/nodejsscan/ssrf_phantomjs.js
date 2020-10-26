const express = require('express')
const app = express()
const port = 3000
const phantom = require('phantom');

app.get('/test', async (req, res) => {
    const instance = await phantom.create();
    const page = await instance.createPage();
    await page.on('onResourceRequested', function (requestData) {
        console.info('Requesting', requestData.url);
    });

    // ruleid: phantom_ssrf
    const status = await page.property('content', req.get('name'));

    // ruleid: phantom_ssrf
    await page.setContent(req.query.q);

    res.send('Hello World!')
})

app.post('/test2', async (req, res) => {
    const instance = await phantom.create();
    const page = await instance.createPage();
    await page.on('onResourceRequested', function (requestData) {
        console.info('Requesting', requestData.url);
    });

    // ruleid: phantom_ssrf
    const status = await page.property('content', req.query.q);

    // ruleid: phantom_ssrf
    await page.setContent(req.body);

    const express = require('express')
    const app = express()
    const port = 3000
    const phantom = require('phantom');

    app.get('/test', async (req, res) => {
        const instance = await phantom.create();
        const page = await instance.createPage();
        await page.on('onResourceRequested', function (requestData) {
            console.info('Requesting', requestData.url);
        });

        // ruleid: phantom_ssrf
        const status = await page.property('content', req.get('name'));

        // ruleid: phantom_ssrf
        await page.setContent(req.query.q);

        res.send('Hello World!')
    })

    app.post('/test2', async (req, res) => {
        const instance = await phantom.create();
        const page = await instance.createPage();
        await page.on('onResourceRequested', function (requestData) {
            console.info('Requesting', requestData.url);
        });

        // ruleid: phantom_ssrf
        const status = await page.property('content', req.query.q);

        // ruleid: phantom_ssrf
        await page.setContent(req.body);


        await instance.exit();

        res.send('Hello World!')
    })

    app.post('/test3', async (req, res) => {
        const instance = await phantom.create();
        const page = await instance.createPage();
        await page.on('onResourceRequested', function (requestData) {
            console.info('Requesting', requestData.url);
        });

        // ruleid: phantom_ssrf
        const status = await page.openUrl(req.params.url, {}, {});

        // ruleid: phantom_ssrf
        await page.evaluateJavaScript(req.body.script);


        await instance.exit();

        res.send('Hello World!')
    })


    app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))
    await instance.exit();

    res.send('Hello World!')
})

app.post('/test3', async (req, res) => {
    const instance = await phantom.create();
    const page = await instance.createPage();
    await page.on('onResourceRequested', function (requestData) {
        console.info('Requesting', requestData.url);
    });

    // ruleid: phantom_ssrf
    const status = await page.openUrl(req.params.url, {}, {});

    // ruleid: phantom_ssrf
    await page.evaluateJavaScript(req.body.script);



    await instance.exit();

    res.send('Hello World!')
})


app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))
