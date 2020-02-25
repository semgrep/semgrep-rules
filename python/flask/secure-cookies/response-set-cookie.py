import flask

app = flask.Flask()

@app.route("/index")
def index():
    response = flask.response.set_cookie("hello", "world")
    return response
