import flask
from flask import response

app = flask.Flask()

@app.route("/index")
def index():
    rep = response.set_cookie("hello", "world")
    return rep

@app.route("/snafu")
def index():
    rep = response.set_cookie("hello", "world", secure=False)
    return rep

@app.route("/admin")
def admin():
    # this cookie is secure
    rep = response.set_cookie("hello", "world", secure=True, httponly=True, samesite="Lax")
    return rep