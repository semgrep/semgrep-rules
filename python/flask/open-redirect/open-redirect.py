from flask import Flask, redirect, request

app = Flask(__name__)

@app.route("open_redirect/")
def open_redirect():
    url = request.args.get("url")
    return redirect(url)

