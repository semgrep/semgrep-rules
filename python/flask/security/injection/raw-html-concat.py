import os
import flask
import hashlib

app = flask.Flask(__name__)

@app.route("/route_param/<route_param>")
def route_param(route_param):
    print("blah")
    # ruleid:raw-html-format
    return "<a href='%s'>Click me!</a>" % route_param

@app.route("/route_param_ok/<route_param>")
def route_param_ok(route_param):
    print("blah")
    # ok: raw-html-format
    return "<a href='https://example.com'>Click me!</a>"

@app.route("/route_param_format/<route_param>")
def route_param_format(route_param):
    print("blah")
    # ruleid:raw-html-format
    return "<a href='{}'>Click me!</a>".format(route_param)

@app.route("/route_param_percent_format/<route_param>")
def route_param_percent_format(route_param):
    print("blah")
    # ruleid:raw-html-format
    return "<a href='%s'>Click me!</a>" % route_param

@app.route("/get_param_inline", methods=["GET"])
def get_param_inline():
    # ruleid:raw-html-format
    return "<a href='%s'>Click me!</a>" % flask.request.args.get("param")

@app.route("/get_param_inline_concat", methods=["GET"])
def get_param_inline_concat():
    # ruleid:raw-html-format
    return "<a href='" + flask.request.args.get("param") + "'>Click me!</a>"

@app.route("/get_param_concat", methods=["GET"])
def get_param_concat():
    param = flask.request.args.get("param")
    # ruleid:raw-html-format
    return "<a href='" + param + "'>Click me!</a>"

@app.route("/get_param_format", methods=["GET"])
def get_param_format():
    param = flask.request.args.get("param")
    # ruleid:raw-html-format
    return "<a href='{}'>Click me!</a>".format(param)

@app.route("/get_param_percent_format", methods=["GET"])
def get_param_percent_format():
    param = flask.request.args.get("param")
    # ruleid:raw-html-format
    return "<a href='%s'>Click me!</a>" % (param,)

@app.route("/post_param_branch", methods=["POST"])
def post_param_branch():
    param = flask.request.form['param']
    if True:
        # ruleid:raw-html-format
        return "<a href='%s'>Click me!</a>" % param

# Real world example
@app.route('/models/<model>')
def load_model(model):
    # ruleid:raw-html-format
    htmlpage = '''
    <body style='margin : 0px; overflow: hidden;'>
        <scene-tag embedded arjs>
            <marker-tag id="memarker" type="pattern" url="../static/patterns/pattern-kanji_qr.patt" vidhandler>
                <entity model="obj: url(../static/models/{}.obj); mtl: url(../static/models/{}.mtl)"> </entity>
            </marker-tag>
        </scene-tag>
    </body>
    '''.format(model,model)
    return htmlpage

@app.route("/ok")
def ok():
    # ok: raw-html-format
    return "<a href='https://example.com'>Click me!</a>"
