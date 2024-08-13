from flask import Flask
from flask import request

app = Flask(__name__)

import ast


# create a route directly on the Flask application object
@app.route("/direct")
def direct_response():

    tainted = request.args.get("input")

    # ruleid: tainted-code-stdlib-flask
    eval(tainted)
    # ruleid: tainted-code-stdlib-flask
    exec(tainted)

    # ok: tainted-code-stdlib-flask
    ast.literal_eval(tainted)

    # ok: tainted-code-stdlib-flask
    eval("clean")
    # ok: tainted-code-stdlib-flask
    exec("clean")

    # ok: tainted-code-stdlib-flask
    ast.literal_eval("clean")
