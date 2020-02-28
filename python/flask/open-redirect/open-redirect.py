from flask import Flask, redirect, request

app = Flask(__name__)

@app.route("open_redirect/")
def open_redirect():
    # ruleid: open-redirect
    url = request.args.get("url")
    print("something")
    return redirect(url)

@app.route("not_open_redirect/")
def not_open_redirect():
    # ok
    url = "/about/"
    return redirect(url)

