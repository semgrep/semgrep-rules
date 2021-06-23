import flask

app = flask.Flask(__name__)

@app.route("/route_param/<route_param>")
def route_param(route_param):
    print("blah")
    # ruleid: exec-injection
    return exec(route_param)

@app.route("/route_param_ok/<route_param>")
def route_param_ok(route_param):
    print("blah")
    # ok: exec-injection
    return exec("this is safe")

@app.route("/get_param", methods=["GET"])
def get_param():
    param = flask.request.args.get("param")
    # ruleid: exec-injection
    exec(param)

@app.route("/get_param_ok", methods=["GET"])
def get_param_ok():
    param = flask.request.args.get("param")
    # ok: exec-injection
    exec("this is safe")

@app.route("/get_param_inline_concat", methods=["GET"])
def get_param_inline_concat():
    # ruleid: exec-injection
    exec("import " + flask.request.args.get("param"))

@app.route("/get_param_concat", methods=["GET"])
def get_param_concat():
    param = flask.request.args.get("param")
    # ruleid: exec-injection
    exec(param + "+ 'hello'")

@app.route("/get_param_format", methods=["GET"])
def get_param_format():
    param = flask.request.args.get("param")
    # ruleid: exec-injection
    exec("import {}".format(param))

@app.route("/get_param_percent_format", methods=["GET"])
def get_param_percent_format():
    param = flask.request.args.get("param")
    # ruleid: exec-injection
    exec("import %s" % (param,))

@app.route("/post_param", methods=["POST"])
def post_param():
    param = flask.request.form['param']
    if True:
        # ruleid: exec-injection
        exec(param)

@app.route("/format", methods=["POST"])
def format():
    param = "{}".format(flask.request.form['param'])
    print("do things")
    # ruleid: exec-injection
    exec(param)

@app.route("/ok")
def ok():
    exec("This is fine")
