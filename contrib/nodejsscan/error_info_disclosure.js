app.get('/', function (req, res) {
    try {
        foo;
    }
    catch (err) {
        res.statusCode = 500;
        res.setHeader("Content-Type", "text/plain");
        // ruleid:node_error_disclosure
        res.end(err.stack);
        return;
    }
});


// ruleid:generic_error_disclosure
try {
    throw new Error("Something unexpected has occurred.");
} catch (e) {
    console.error(e);
}

// ruleid:generic_error_disclosure
console.trace("baad")
