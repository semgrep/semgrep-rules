import code

import flask

app = flask.Flask(__name__)


@app.route("/route_param/<route_param>")
def route_param(route_param):

    console = code.InteractiveConsole()
    # ruleid: dangerous-interactive-code-run
    console.push(route_param)

    return "oops!"


# Flask true negatives
@app.route("/route_param/<route_param>")
def route_param2(route_param):

    console = code.InteractiveConsole()
    # ok: dangerous-interactive-code-run
    console.push("print(123)")

    return "ok!"
