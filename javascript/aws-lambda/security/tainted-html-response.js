exports.handler = function (event, context) {
    const html = `<div>${event.name}</div>`;

    const someRandomStuff = {
        // ok: tainted-html-response
        data: event.foo
    }
    bar(someRandomStuff)

    const response = {
        statusCode: 200,
        // ruleid: tainted-html-response
        body: html,
        headers: {
            'Content-Type': 'text/html',
        }
    };

    return response
}
