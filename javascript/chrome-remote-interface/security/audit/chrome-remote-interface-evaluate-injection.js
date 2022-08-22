const CDP = require('chrome-remote-interface');

async function example(userInput) {
    let client;
    try {
        client = await CDP();
        const {Runtime} = client;
        const script1 = "document.querySelector('p').textContent"
        // ok
        const result = await Runtime.evaluate({expression: script1});
        // chrome-remote-interface-evaluate-injection
        const result2 = await Runtime.evaluate({expression: userInput});
        // chrome-remote-interface-evaluate-injection
        const result3 = await Runtime.evaluate({expression: 'var x = 123;' + userInput});
    } catch (err) {
        console.error(err);
    } finally {
        if (client) {
            await client.close();
        }
    }
}
