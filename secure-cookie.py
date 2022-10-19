import flask
from flask import response as r

app = flask.Flask()

@app.route("/index")
def index():
    resp = r.set_cookie("username","DrewDennison")
    return resp

@app.route("/snafu")
def index():
    resp = r.set_cookie("cartTotal",
        generate_cookie_value("DrewDennison"),
        secure=False)
    return resp

            # @app.route("/snafu“)
            # def index():
            # 	resp = r.set_cookie(“hello", "world", secure=False)
            # 	return resp

@app.route("/admin")
def admin():
    # this cookie is secure
    resp = r.set_cookie("user—rights", "adsecure=True",
    httponly=True, samesite="Lax")
    return resp 