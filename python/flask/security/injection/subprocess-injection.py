import subprocess
import sys
import flask

app = flask.Flask(__name__)

@app.route("a")
def a():
    ip = flask.request.args.get("ip")
    # ruleid:subprocess-injection
    subprocess.run("ping "+ ip)

@app.route("b")
def b():
    host = flask.request.headers["HOST"]
    # ruleid:subprocess-injection
    subprocess.run("echo {} > log".format(host))

@app.route("c/<ip>")
def c(ip):
    # ruleid:subprocess-injection
    subprocess.run("ping "+ ip)

@app.route("d/<cmd>/<ip>")
def d(cmd, ip):
    command = [cmd, ip]
    # ruleid:subprocess-injection
    subprocess.capture_output(command)

@app.route("e")
def e():
    event = flask.request.json
    cmd = event['id'].split()
    # ruleid:subprocess-injection
    subprocess.call([cmd[0], cmd[1], "some", "args"])

@app.route("f")
def f():
    event = flask.request.get_json()
    # ruleid:subprocess-injection
    subprocess.run(["bash", "-c", event['id']], shell=True)

@app.route("g")
def g():
    event = flask.request.json
    python_file = f"""
        print("What is your name?")
        name = input()
        print("Hello " + {event['id']})
    """
    # ruleid:subprocess-injection
    program = subprocess.Popen(['python2', python_file], stdin=subprocess.PIPE, text=True)
    program.communicate(input=payload, timeout=1)

@app.route("d_ok/<cmd>/<ip>")
def d_ok(cmd, ip):
    # ok:subprocess-injection
    subprocess.capture_output(["ping", cmd, ip])

@app.route("d_ok2/<ip>")
def d_ok2(ip):
    cmd = ["ping", ip]
    # ok:subprocess-injection
    subprocess.capture_output(cmd)

@app.route("e")
def e_ok():
    allowed = {'p': "ping"}

    event = flask.request.json
    cmd = event['id'].split()

    valid = allowed[cmd[0]]
    # ok:subprocess-injection
    subprocess.call([valid, "some", "args"])


@app.route("ok")
def ok():
    ip = flask.request.args.get("ip")
    subprocess.run(["ping", ip])

@app.route("ok2")
def ok2():
    ip = flask.request.args.get("ip")
    subprocess.run("echo 'nothing'")

@app.route("ok3")
def ok3():
    ip = flask.request.args.get("ip")
    subprocess.call(["echo", "a", ";", "rm", "-rf", "/"])



