const CDP = require('chrome-remote-interface');

function example(userInput) {

    CDP(async (client) => {
        const {Page} = client;
        try {
            await Page.enable();
            await Page.navigate({url: 'https://github.com'});
            await Page.loadEventFired();
            // ok
            const result = await Page.printToPDF({landscape: true, printBackground: true, headerTemplate: '<h1>Title</h1>'});
            // chrome-remote-interface-printtopdf-injection
            const result2 = await Page.printToPDF({landscape: true, printBackground: true, footerTemplate: userInput});
            // chrome-remote-interface-printtopdf-injection
            const result3 = await Page.printToPDF({landscape: true, printBackground: true, headerTemplate: '<h1>' + userInput + '</h1>'});
            fs.writeFileSync('page.pdf', Buffer.from(data, 'base64'));
        } catch (err) {
            console.error(err);
        } finally {
            await client.close();
        }
    }).on('error', (err) => {
        console.error(err);
    });

}
