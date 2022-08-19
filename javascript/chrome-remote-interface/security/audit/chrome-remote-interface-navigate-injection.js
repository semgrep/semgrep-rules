const CDP = require('chrome-remote-interface');

async function example(userInput) {
    let client;
    try {
        client = await CDP();
        const {Network, Page} = client;
        Network.requestWillBeSent((params) => {
            console.log(params.request.url);
        });
        await Network.enable();
        await Page.enable();
        // ok
        await Page.navigate({url: 'https://github.com'});
        // chrome-remote-interface-navigate-injection
        await Page.navigate({url: userInput});
        await Page.loadEventFired();
    } catch (err) {
        console.error(err);
    } finally {
        if (client) {
            await client.close();
        }
    }
}
