import os
import flask

app = flask.Flask(__name__)


@app.route("/route_param/<route_param>")
def route_param(route_param):

    # ruleid:dangerous-os-exec
    os.execl("/bin/bash", "/bin/bash", "-c", route_param)

    return "oops!"


# Flask true negatives
@app.route("/route_param/<route_param>")
def route_param2(route_param):

    # ok:dangerous-os-exec
    os.execl("static")

    return "ok!"
