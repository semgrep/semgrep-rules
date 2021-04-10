import os
import flask
import hashlib

app = flask.Flask(__name__)

@app.route("/route_param/<route_param>")
def route_param(route_param):
    print("blah")
    # ruleid: os-system-injection
    return os.system(route_param)

@app.route("/route_param_ok/<route_param>")
def route_param_ok(route_param):
    print("blah")
    # ok: os-system-injection
    return os.system("ls -la")

@app.route("/route_param_concat/<route_param>")
def route_param_concat(route_param):
    print("blah")
    # ruleid: os-system-injection
    return os.system("echo " + route_param)

@app.route("/route_param_format/<route_param>")
def route_param_format(route_param):
    print("blah")
    # ruleid: os-system-injection
    return os.system("echo {}".format(route_param))

@app.route("/route_param_percent_format/<route_param>")
def route_param_percent_format(route_param):
    print("blah")
    # ruleid: os-system-injection
    return os.system("echo %s" % route_param)

@app.route("/get_param_inline", methods=["GET"])
def get_param_inline():
    # ruleid: os-system-injection
    os.system(flask.request.args.get("param"))

@app.route("/get_param_inline_concat", methods=["GET"])
def get_param_inline_concat():
    # ruleid: os-system-injection
    os.system("echo " + flask.request.args.get("param"))

@app.route("/get_param", methods=["GET"])
def get_param():
    param = flask.request.args.get("param")
    # ruleid: os-system-injection
    os.system(param)

@app.route("/get_param_concat", methods=["GET"])
def get_param_concat():
    param = flask.request.args.get("param")
    # ruleid: os-system-injection
    os.system("echo " + param)

@app.route("/get_param_format", methods=["GET"])
def get_param_format():
    param = flask.request.args.get("param")
    # ruleid: os-system-injection
    os.system("echo {}".format(param))

@app.route("/get_param_percent_format", methods=["GET"])
def get_param_percent_format():
    param = flask.request.args.get("param")
    # ruleid: os-system-injection
    os.system("echo %s" % (param,))

@app.route("/post_param", methods=["POST"])
def post_param():
    param = flask.request.form['param']
    # ruleid: os-system-injection
    os.system(param)

@app.route("/post_param_branch", methods=["POST"])
def post_param_branch():
    param = flask.request.form['param']
    if True:
        # ruleid: os-system-injection
        os.system(param)

@app.route("/subexpression", methods=["POST"])
def subexpression():
    param = "{}".format(flask.request.form['param'])
    print("do things")
    # ruleid: os-system-injection
    os.system(param)

@app.route("/subexpression_concat", methods=["POST"])
def subexpression_concat():
    param = "{}".format(flask.request.form['param'])
    print("do things")
    # ruleid: os-system-injection
    os.system("echo " + param)

@app.route("/subexpression_format", methods=["POST"])
def subexpression_format():
    param = "{}".format(flask.request.form['param'])
    print("do things")
    # ruleid: os-system-injection
    os.system("echo {}".format(param))

@app.route("/subexpression_percent_format", methods=["POST"])
def subexpression_percent_format():
    param = "{}".format(flask.request.form['param'])
    print("do things")
    # ruleid: os-system-injection
    os.system("echo %s" % param)

# Real world example
@app.route('/', methods=['GET', 'POST'])
def index():
    if flask.request.method == 'GET':
        return flask.render_template('index.html')
    # check url first
    url = flask.request.form.get('url', None)
    if url != '':
        md5 = hashlib.md5(url+app.config['MD5_SALT']).hexdigest()
        fpath = join(join(app.config['MEDIA_ROOT'], 'upload'), md5+'.jpg')
        # ruleid: os-system-injection
        r = os.system('wget %s -O "%s"'%(url, fpath))
        if r != 0: abort(403)
        return flask.redirect(flask.url_for('landmark', hash=md5))

@app.route("/ok")
def ok():
    # ok: os-system-injection
    os.system("This is fine")
