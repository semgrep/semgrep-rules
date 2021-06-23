import flask
import requests

app = flask.Flask(__name__)

@app.route("/route_param/<route_param>")
def route_param(route_param):
    print("blah")
    # ruleid: ssrf-requests
    return requests.get(route_param)

@app.route("/route_param_ok/<route_param>")
def route_param_ok(route_param):
    print("blah")
    # ok: ssrf-requests
    return requests.get("this is safe")

@app.route("/get_param", methods=["GET"])
def get_param():
    param = flask.request.args.get("param")
    # ruleid: ssrf-requests
    requests.post(param, timeout=10)

@app.route("/get_param_ok", methods=["GET"])
def get_param_ok():
    param = flask.request.args.get("param")
    # ok: ssrf-requests
    requests.post("this is safe", timeout=10)

@app.route("/get_param_inline_concat", methods=["GET"])
def get_param_inline_concat():
    # ruleid: ssrf-requests
    requests.get(flask.request.args.get("param") + "/id")

@app.route("/get_param_concat", methods=["GET"])
def get_param_concat():
    param = flask.request.args.get("param")
    # ruleid: ssrf-requests
    requests.get(param + "/id")

@app.route("/get_param_format", methods=["GET"])
def get_param_format():
    param = flask.request.args.get("param")
    # ruleid: ssrf-requests
    requests.get("{}.csv".format(param))

@app.route("/get_param_percent_format", methods=["GET"])
def get_param_percent_format():
    param = flask.request.args.get("param")
    # ruleid: ssrf-requests
    requests.get("%s/id" % (param,))

@app.route("/post_param", methods=["POST"])
def post_param():
    param = flask.request.form['param']
    if True:
        # ruleid: ssrf-requests
        requests.get(param)

@app.route("/subexpression", methods=["POST"])
def subexpression():
    param = "{}".format(flask.request.form['param'])
    print("do things")
    # ruleid: ssrf-requests
    requests.post(param, data={"hello", "world"})

@app.route("/ok")
def ok():
    requests.get("https://www.google.com")
