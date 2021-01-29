const CDP = require('chrome-remote-interface');

async function example(userInput) {
    let client;
    try {
        client = await CDP();
        const {Runtime} = client;
        const script1 = "document.querySelector('p').textContent"
        // ok
        const result = await Runtime.compileScript({expression: script1, sourceURL:"", persistScript:false, executionContextId:1});
        // ruleid:chrome-remote-interface-compilescript-injection
        const result2 = await Runtime.compileScript({expression: userInput, sourceURL:"", persistScript:false, executionContextId:1});
        // ruleid:chrome-remote-interface-compilescript-injection
        const result3 = await Runtime.compileScript({expression: 'var x = 123;' + userInput, sourceURL:"", persistScript:false, executionContextId:1});
    } catch (err) {
        console.error(err);
    } finally {
        if (client) {
            await client.close();
        }
    }
}
