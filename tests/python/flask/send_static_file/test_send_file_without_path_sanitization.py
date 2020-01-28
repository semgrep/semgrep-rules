import flask

app = Flask(__name__)

@app.route('/uploads/<path:filename>')
def download_file(filename):
  return send_file(filename)