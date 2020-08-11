from flask import Flask, redirect, request, url_for
from werkzeug.urls import url_parse

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

@app.route("filter")
def filter():
    # ok
    next_page = request.args.get('next')
    if not next_page or url_parse(next_page).netloc != '':
        next_page = url_for('main.index')
    return redirect(next_page)