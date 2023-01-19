## Normal import
import flask
import json
app = flask.Flask(__name__)

@app.route("/user")
def user():
    user_dict = get_user(request.args.get("id"))
    # ruleid:use-jsonify
    return json.dumps(user_dict)

from json import dumps

@app.route("/user")
def user():
    user_dict = get_user(request.args.get("id"))
    # ruleid:use-jsonify
    return dumps(user_dict)

# ok: use-jsonify
def dumps():
  pass
def test_empty_dumps():
# ok: use-jsonify
    dumps()
