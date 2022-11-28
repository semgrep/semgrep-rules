# cf. https://github.com/returntocorp/semgrep/blob/develop/docs/writing_rules/examples.md#auditing-dangerous-function-use

import subprocess
import flask

app = flask.Flask(__name__)


@app.route("/route_param/<route_param>")
def route_param(route_param):

    # ruleid:dangerous-subprocess-use
    subprocess.call("grep -R {} .".format(route_param), shell=True, cwd="/home/user")

    # ruleid:dangerous-subprocess-use
    subprocess.call(["sh", "-c", "grep -R {} .".format(route_param)], shell=True, cwd="/home/user") # Tests list input

    # ruleid:dangerous-subprocess-use
    subprocess.call(("sh", "-c", "grep -R {} .".format(route_param)), shell=True, cwd="/home/user") # Tests tuple input

    # ruleid:dangerous-subprocess-use
    subprocess.call("grep -R {} .".format(route_param), shell=True, cwd="/home/user")

    return "oops!"


# Flask true negatives
@app.route("/route_param/<route_param>")
def route_param2(route_param):

    # ok:dangerous-subprocess-use
    subprocess.call("static", shell=True, cwd="/home/user")

    # ok:dangerous-subprocess-use
    subprocess.call(["sh", "-c", "/bin/ls"], shell=True, cwd="/home/user")

    # ok:dangerous-subprocess-use
    subprocess.call(("sh", "-c", "/bin/ls"), shell=True, cwd="/home/user")

    return "ok!"
