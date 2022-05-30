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
    if (id !== 'constructor' && id !== '__proto__') {
        let items = req.session.todos[id];
        if (!items) {
            items = req.session.todos[id] = {};
        }
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

app.get('/testOk5/:id', (req, res) => {
    let id = req.params.id;
    let items = req.session.todos[id];
    if (!items) {
        items = req.session.todos[id] = [];
    }
    // ok: prototype-pollution-assignment
    for (let i = 0; i < items.length; i++) {
        items[i] = req.query.text;
    }
    res.end(200);
});
