from flask import Blueprint

blueprint = Blueprint()


# FP: Only 1 decorator
@blueprint.route("HAI")
def f():
    pass

# FP: Correct order
@blueprint.route("HAI")
@another.func("HAI")
def f():
    pass

# FP: "func" not "route"
@another.func("HAI")
@blueprint.func("HAI")
def f():
    pass

# FP: Correct order with app
@app.route("HAI")
@another.func("HAI")
def f():
    pass

@blueprint.route("HAI")
@app.route("HAI")
def f():
    pass

@another.func("HAI")
@app.route("HAI")
@app.route("HAI")
def f():
    pass

@app.route("ABC")
@app.route("HAI")
@another.func("HAI")
@app.route("BCD")
@app.route("HAI")
def f():
    pass
