import flask
from flask import response as r

app = flask.Flask()

@app.route("/index")
def index():
    rep = r.set_cookie("hello", "world")
    return rep

@app.route("/snafu")
def index():
    rep = r.set_cookie("hello",
    generate_cookie_value("world"),
    secure=False)
    return rep

# @app.route("/snafu")
# def index():
#     rep = r.set_cookie("hello", "world", secure=False)
#     return rep

@app.route("/admin")
def admin():
    # this cookie is secure
    rep = r.set_cookie("hello", "world", secure=True, httponly=True, samesite="Lax")
    return rep