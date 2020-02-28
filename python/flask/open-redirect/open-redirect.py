from flask import Flask, redirect, request

app = Flask(__name__)

@app.route("open_redirect/")
def open_redirect():
    # ruleid: open-redirect
    url = request.args.get("url")
    return redirect(url)

