const CDP = require('chrome-remote-interface');

function example(userInput) {
    CDP(async (client) => {
        const {Page} = client;
        try {
            const {frameId} = await Page.navigate({url: 'about:blank'});
            const html = '<html>test</html>';
            // ok
            await Page.setDocumentContent({frameId, html});
            // chrome-remote-interface-setdocumentcontent-injection
            await Page.setDocumentContent({frameId, html: userInput});
        } catch (err) {
            console.error(err);
            client.close();
        }
    }).on('error', (err) => {
        console.error(err);
    });
}
