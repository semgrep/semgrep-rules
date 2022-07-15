import os
import flask
import hashlib
import requests

app = flask.Flask(__name__)

@app.route("/buy/<tid>")
def buy_thing(tid):
    price = get_price()

    # ruleid: nan-injection
    x = float(tid)

    if x < price:
        return deny()
    return buy()

@app.route("unit_1")
def unit_1():
    tid = flask.request.args.get("tid")

    # ruleid: nan-injection
    bool(tid)

    # ruleid: nan-injection
    complex(tid)

@app.route("unit_1_5")
def unit_1_5():
    tid = flask.request.args["tid"]

    # ruleid: nan-injection
    float(tid)

    # ruleid: nan-injection
    bool(tid)

    # ruleid: nan-injection
    complex(tid)

@app.route("unit_2")
def unit_2():
    tid = flask.request.args.get("tid")

    # ok: nan-injection
    bool(int(tid))

    # ok: nan-injection
    float(int(tid))

@app.route("unit_3")
def unit_3():
    tid = flask.request.args.get("tid")

    # ok: nan-injection
    obj = fetch_obj(tid)

    # ok: nan-injection
    num = float(obj.num)

@app.route("/drip")
def drip():
    # ruleid: nan-injection
    duration = float(flask.request.args.get("duration", 2))
    numbytes = min(int(flask.request.args.get("numbytes", 10)), (10 * 1024 * 1024))  # set 10MB limit
    code = int(flask.request.args.get("code", 200))

    if numbytes <= 0:
        response = Response("number of bytes must be positive", status=400)
        return response

    # ruleid: nan-injection
    delay = float(flask.request.args.get("delay", 0))
    if delay > 0:
        time.sleep(delay)

    pause = duration / numbytes

    def generate_bytes():
        for i in xrange(numbytes):
            yield b"*"
            time.sleep(pause)

    response = Response(
        generate_bytes(),
        headers={
            "Content-Type": "application/octet-stream",
            "Content-Length": str(numbytes),
        },
    )

    response.status_code = code

    return response
