import flask
import json

app = flask.Flask(__name__)

@app.route("/route_param/<route_param>")
def route_param(route_param):
    print("blah")
    # ruleid: path-traversal-open
    return open(route_param, 'r').read()

@app.route("/route_param_ok/<route_param>")
def route_param_ok(route_param):
    print("blah")
    # ok: path-traversal-open
    return open("this is safe", 'r').read()

@app.route("/route_param_with/<route_param>")
def route_param_with(route_param):
    print("blah")
    # ruleid: path-traversal-open
    with open(route_param, 'r') as fout:
        return fout.read()

@app.route("/route_param_with_ok/<route_param>")
def route_param_with_ok(route_param):
    print("blah")
    # ok: path-traversal-open
    with open("this is safe", 'r') as fout:
        return fout.read()

@app.route("/route_param_with_concat/<route_param>")
def route_param_with_concat(route_param):
    print("blah")
    # ruleid: path-traversal-open
    with open(route_param + ".csv", 'r') as fout:
        return fout.read()

@app.route("/get_param", methods=["GET"])
def get_param():
    param = flask.request.args.get("param")
    # ruleid: path-traversal-open
    f = open(param, 'w')
    f.write("hello world")

@app.route("/get_param_inline_concat", methods=["GET"])
def get_param_inline_concat():
    # ruleid: path-traversal-open
    return open("echo " + flask.request.args.get("param"), 'r').read()

@app.route("/get_param_concat", methods=["GET"])
def get_param_concat():
    param = flask.request.args.get("param")
    # ruleid: path-traversal-open
    return open(param + ".csv", 'r').read()

@app.route("/get_param_format", methods=["GET"])
def get_param_format():
    param = flask.request.args.get("param")
    # ruleid: path-traversal-open
    return open("{}.csv".format(param)).read()

@app.route("/get_param_percent_format", methods=["GET"])
def get_param_percent_format():
    param = flask.request.args.get("param")
    # ruleid: path-traversal-open
    return open("echo %s" % (param,), 'r').read()

@app.route("/post_param", methods=["POST"])
def post_param():
    param = flask.request.form['param']
    if True:
        # ruleid: path-traversal-open
        with open(param, 'r') as fin:
            data = json.load(fin)
    return data

@app.route("/post_param", methods=["POST"])
def post_param_with_inline():
    # ruleid: path-traversal-open
    with open(flask.request.form['param'], 'r') as fin:
        data = json.load(fin)
    return data

@app.route("/post_param", methods=["POST"])
def post_param_with_inline_concat():
    # ruleid: path-traversal-open
    with open(flask.request.form['param'] + '.csv', 'r') as fin:
        data = json.load(fin)
    return data

@app.route("/subexpression", methods=["POST"])
def subexpression():
    param = "{}".format(flask.request.form['param'])
    print("do things")
    # ruleid: path-traversal-open
    return open(param, 'r').read()

@app.route("/ok")
def ok():
    # ok: path-traversal-open
    open("static/path.txt", 'r')
