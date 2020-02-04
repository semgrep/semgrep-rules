from flask import request

app = Flask(__name__)


# ruleid:avoid-accessing-request-in-wrong-handler
@app.route('/', method="GET")
def handler_with_get_json(ff):
  r = request.json
  return

# ruleid:avoid-accessing-request-in-wrong-handler
@app.route('/', method="GET")
def handler_with_get_form(ff):
  r = request.form
  return

# ruleid:avoid-accessing-request-in-wrong-handler
@app.route('/', method="GET")
def handler_with_data(ff):
  r = request.data
  return

# ruleid:avoid-accessing-request-in-wrong-handler
@app.route('/', methods=["GET", "POST"])
def handler_with_mupltiple_methods_json(ff):
  r = request.json
  return

# ruleid:avoid-accessing-request-in-wrong-handler
@app.route('/', methods=["GET", "POST"])
def handler_with_mupltiple_methods_form(ff):
  r = request.form
  return

# ruleid:avoid-accessing-request-in-wrong-handler
@app.route('/', methods=["GET", "POST"])
def handler_with_mupltiple_methods_data(ff):
  r = request.data
  return
