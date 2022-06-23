import _xxsubinterpreters

import os
import flask

app = flask.Flask(__name__)


@app.route("/route_param/<route_param>")
def route_param(route_param):

    # ruleid:dangerous-subinterpreters-run-string
    _xxsubinterpreters.run_string(_xxsubinterpreters.create(), route_param)

    return "oops!"


# Flask true negatives
@app.route("/route_param/<route_param>")
def route_param2(route_param):

    # ok:dangerous-subinterpreters-run-string
    _xxsubinterpreters.run_string(_xxsubinterpreters.create(), "static")

    return "ok!"
