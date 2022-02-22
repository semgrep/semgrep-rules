exports.handler = function (event, context) {
    const html = `<div>${event.name}</div>`;

    const response = {
        statusCode: 200,
        headers: {
            'Content-Type': 'text/html',
        },
        // ruleid: tainted-html-response
        body: html
    };

    return response
}
