from flask import send_file

app = Flask(__name__)

@app.route("/<path:filename>")
def download_file(filename):
  return send_file(filename)