from flask import Blueprint

blueprint = Blueprint()


# ok: Only 1 decorator
@blueprint.route("HAI")
def f():
    pass

# ok: Correct order
@blueprint.route("HAI")
@another.func("HAI")
def f():
    pass

# ok: "func" not "route"
@another.func("HAI")
@blueprint.func("HAI")
def f():
    pass

# ok: Correct order with app
@app.route("HAI")
@another.func("HAI")
def f():
    pass

# ok: 2 routes are independent
@blueprint.route("HAI")
@app.route("HAI")
def f():
    pass

# ruleid: flask-route-decorator
@another.func("HAI")
@app.route("HAI")
@app.route("HAI")
def f():
    pass


@app.route("ABC")
@app.route("HAI")
# ruleid: flask-route-decorator
@another.func("HAI")
@app.route("BCD")
@app.route("HAI")
def f():
    pass
