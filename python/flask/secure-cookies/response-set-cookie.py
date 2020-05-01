import flask
from flask import response

app = flask.Flask()

app.config.update(
    SESSION_COOKIE_SECURE=True,
    SESSION_COOKIE_HTTPONLY=True,
    SESSION_COOKIE_SAMESITE='Lax',
)

@app.route("/index")
def index():
    # ruleid:secure-set-cookie
    rep = response.set_cookie("hello", "world")
    return rep

@app.route("/some")
def some():
    # ruleid:secure-set-cookie
    rep = response.set_cookie("hello", "world", httponly=True)
    return rep

@app.route("/admin")
def admin():
    # ok
    rep = response.set_cookie("hello", "world", secure=True, httponly=True, samesite="Lax")
    return rep
