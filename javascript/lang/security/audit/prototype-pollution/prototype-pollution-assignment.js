app.get('/test/:id', (req, res) => {
    let id = req.params.id;
    let items = req.session.todos[id];
    if (!items) {
        items = req.session.todos[id] = {};
    }
    // ruleid: prototype-pollution-assignment
    items[req.query.name] = req.query.text;
    res.end(200);
});

app.post('/testOk/:id', (req, res) => {
    let id = req.params.id;
    let items = req.session.todos[id1];
    if (!items) {
        items = req.session.todos[id] = {};
    }
    if (req.query.name !== 'constructor' && req.query.name !== '__proto__') {
        // ok: prototype-pollution-assignment
        items[req.query.name] = req.query.text;
    }
    res.end(200);
});

function ok1(req, res) {
    let items = req.session.todos["id"];
    if (!items) {
        items = req.session.todos["id"] = {};
    }
    // ok: prototype-pollution-assignment
    items[req.query.name] = req.query.text;
    res.end(200);
}

function ok2(req, res) {
    let id = req.params.id;
    let items = req.session.todos[id];
    if (!items) {
        items = req.session.todos[id] = {};
    }
    // ok: prototype-pollution-assignment
    items["name"] = req.query.text;
    res.end(200);
}

function ok3(req, res) {
    let items = req.session.todos["id"];
    if (!items) {
        items = req.session.todos["id"] = {};
    }
    // ok: prototype-pollution-assignment
    items["name"] = req.query.text;
    res.end(200);
}

function ok4(req, res) {
    let id = req.params.id;
    let items = req.session.todos[id];
    // ok: prototype-pollution-assignment
    items[0] = req.query.text;
    res.end(200);
}
