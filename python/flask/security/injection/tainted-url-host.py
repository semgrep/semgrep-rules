import os
import flask
import hashlib
import requests

app = flask.Flask(__name__)

@app.route("/route_param/<route_param>")
def route_param(route_param):
    print("blah")
    # ruleid: tainted-url-host
    url = "https://%s/path" % route_param
    requests.get(url)

    # ruleid: tainted-url-host
    url = "http://%r/path" % route_param
    requests.get(url)

    return True

@app.route("/route_param_ok/<route_param>")
def route_param_ok(route_param):
    print("blah")
    # ok: tainted-url-host
    return "<a href='https://example.com'>Click me!</a>"

@app.route("/route_param_format/<route_param>")
def route_param_format(route_param):
    print("blah")
    # ruleid: tainted-url-host
    return "<a href='https://{}/path'>Click me!</a>".format(route_param)

@app.route("/route_param_format_ok_in_path/<route_param>")
def route_param_format_ok_in_path(route_param):
    print("blah")
    # ok: tainted-url-host
    return "<a href='https://example.com/{}/path'>Click me!</a>".format(route_param)

@app.route("/route_param_percent_format/<route_param>")
def route_param_percent_format(route_param):
    print("blah")
    # ruleid: tainted-url-host
    return "<a href='https://%s/path'>Click me!</a>" % route_param

@app.route("/route_param_percent_format_ok_in_path/<route_param>")
def route_param_percent_format_ok_in_path(route_param):
    print("blah")
    # ok: tainted-url-host
    return "<a href='https://example.com/%s/path'>Click me!</a>" % route_param

@app.route("/get_param_inline", methods=["GET"])
def get_param_inline():
    # ruleid: tainted-url-host
    return "<a href='https://%s/path'>Click me!</a>" % flask.request.args.get("param")

@app.route("/get_param_inline_concat", methods=["GET"])
def get_param_inline_concat():
    # ruleid: tainted-url-host
    return "<a href='http://" + flask.request.args.get("param") + "'>Click me!</a>"

@app.route("/get_param_inline_concat_ok_in_path", methods=["GET"])
def get_param_inline_concat_ok_in_path():
    # ok: tainted-url-host
    return "<a href='http://example.com/" + flask.request.args.get("param") + "'>Click me!</a>"

@app.route("/get_param_template", methods=["GET"])
def get_param_template():
    # ruleid: tainted-url-host
    return f"<a href='https://{flask.request.args.get('param')}/path'>Click me!</a>"

@app.route("/get_param_template_ok_in_path", methods=["GET"])
def get_param_template_ok_in_path():
    # ok: tainted-url-host
    return f"<a href='https://example.com/{flask.request.args.get('param')}/path'>Click me!</a>"

@app.route("/get_param_concat", methods=["GET"])
def get_param_concat():
    param = flask.request.args.get("param")
    # ruleid: tainted-url-host
    return "<a href='https://" + param + "/path'>Click me!</a>"

@app.route("/get_param_format", methods=["GET"])
def get_param_format():
    param = flask.request.args.get("param")
    # ruleid: tainted-url-host
    return "<a href='https://{}/path'>Click me!</a>".format(param)

@app.route("/get_param_percent_format", methods=["GET"])
def get_param_percent_format():
    param = flask.request.args.get("param")
    # ruleid: tainted-url-host
    return "<a href='https://%s/path'>Click me!</a>" % (param,)

@app.route("/post_param_branch", methods=["POST"])
def post_param_branch():
    param = flask.request.form['param']
    if True:
        # ruleid: tainted-url-host
        return "<a href='https://%r/path'>Click me!</a>" % (param,)

# Real world example
@app.route('/models/<model>')
def load_model(model):
    # ruleid: tainted-url-host
    htmlpage = '''
    <body style='margin : 0px; overflow: hidden;'>
        <scene-tag embedded arjs>
            <marker-tag id="memarker" type="pattern" url="../static/patterns/pattern-kanji_qr.patt" vidhandler>
                <entity model="obj: url(https://{}/static/models.obj); mtl: url(../static/models/{}.mtl)"> </entity>
            </marker-tag>
        </scene-tag>
    </body>
    '''.format(model,model)
    return htmlpage

# Real world example
@app.route('/models/<model>')
def load_model(model):
    # ok: tainted-url-host
    htmlpage = '''
    <body style='margin : 0px; overflow: hidden;'>
        <scene-tag embedded arjs>
            <marker-tag id="memarker" type="pattern" url="../static/patterns/pattern-kanji_qr.patt" vidhandler>
                <entity model="obj: url(../static/models.obj); mtl: url(../static/models/{}.mtl)"> </entity>
            </marker-tag>
        </scene-tag>
    </body>
    '''.format(model,model)
    return htmlpage

@app.route("/const_prop")
def const_prop():
    url = "https://"
    # ruleid: tainted-url-host
    url = url + flask.request.args.get("param")

    requests.get(url)
    return True

@app.route("/add_equals")
def add_equals():
    url = "https://"
    # ruleid: tainted-url-host
    url += flask.request.args.get("param")

    requests.get(url)
    return True

@app.route("/route_param/<route_param>")
def doesnt_use_the_route_param(route_param):
    not_the_route_param = "hello.com"
    # ok: tainted-url-host
    url = "https://%s/path" % not_the_route_param
    requests.get(url)

    # ok: tainted-url-host
    url = "http://%r/path" % not_the_route_param
    requests.get(url)

    return True
