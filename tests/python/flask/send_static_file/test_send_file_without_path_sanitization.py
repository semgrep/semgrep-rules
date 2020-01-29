from flask import send_file

app = Flask(__name__)

def download_file():
  return send_file()