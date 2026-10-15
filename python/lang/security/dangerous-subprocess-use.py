# cf. https://github.com/returntocorp/semgrep/blob/develop/docs/writing_rules/examples.md#auditing-dangerous-function-use

import subprocess
import flask

app = flask.Flask(__name__)


@app.route("/route_param/<route_param>")
def route_param(route_param):

    # ruleid:dangerous-subprocess-use
    subprocess.call("grep -R {} .".format(route_param), shell=True, cwd="/home/user")

    # ruleid:dangerous-subprocess-use
    subprocess.call(["sh", "-c", "grep -R {} .".format(route_param)], shell=True, cwd="/home/user") # Tests list input

    # ruleid:dangerous-subprocess-use
    subprocess.call(("sh", "-c", "grep -R {} .".format(route_param)), shell=True, cwd="/home/user") # Tests tuple input

    # ruleid:dangerous-subprocess-use
    subprocess.call("grep -R {} .".format(route_param), shell=True, cwd="/home/user")

    return "oops!"


# Flask true negatives
@app.route("/route_param/<route_param>")
def route_param2(route_param):

    # ok:dangerous-subprocess-use
    subprocess.call("static", shell=True, cwd="/home/user")

    # ok:dangerous-subprocess-use
    subprocess.call(["sh", "-c", "/bin/ls"], shell=True, cwd="/home/user")

    # ok:dangerous-subprocess-use
    subprocess.call(("sh", "-c", "/bin/ls"), shell=True, cwd="/home/user")

    return "ok!"


# List/tuple forms that still hand a tainted string to a shell or an
# interpreter must be reported (cf. #4084).
@app.route("/list_forms/<route_param>")
def list_forms(route_param):

    # ruleid:dangerous-subprocess-use
    subprocess.run(["bash", "-lc", route_param])

    # ruleid:dangerous-subprocess-use
    subprocess.run(["bash", "-e", "-c", route_param])

    # ruleid:dangerous-subprocess-use
    subprocess.run(["sh", "-c", route_param, "arg0"])

    # ruleid:dangerous-subprocess-use
    subprocess.run(["env", "sh", "-c", route_param])

    # ruleid:dangerous-subprocess-use
    subprocess.run(["env", "FOO=bar", "/bin/sh", "-c", route_param])

    # ruleid:dangerous-subprocess-use
    subprocess.run(["python3", "-c", route_param])

    # ruleid:dangerous-subprocess-use
    subprocess.run(["node", "-e", route_param])

    # ruleid:dangerous-subprocess-use
    subprocess.run(["perl", "-e", route_param])

    # ruleid:dangerous-subprocess-use
    subprocess.run(["task", "-c", route_param], executable="/bin/sh")

    # ruleid:dangerous-subprocess-use
    subprocess.run(args=route_param, shell=True)

    # ruleid:dangerous-subprocess-use
    subprocess.run(args=["sh", "-c", route_param])

    # ruleid:dangerous-subprocess-use
    subprocess.run(("bash", "-lc", route_param))

    # ruleid:dangerous-subprocess-use
    subprocess.run("bash", "-lc", route_param)

    # ruleid:dangerous-subprocess-use
    subprocess.run(["/bin/sh", "-c", route_param])

    # ruleid:dangerous-subprocess-use
    subprocess.run("python3", "-c", route_param)

    # ruleid:dangerous-subprocess-use
    subprocess.run(["/usr/bin/python3", "-c", route_param])

    return "oops!"


@app.route("/list_forms_ok/<route_param>")
def list_forms_ok(route_param):

    # ok:dangerous-subprocess-use
    subprocess.run(["ssh", "-c", route_param])

    # ok:dangerous-subprocess-use
    subprocess.run("ssh", "-c", route_param)

    # ok:dangerous-subprocess-use
    subprocess.run(["bash", "-e", "-c", "/bin/ls"])

    # ok:dangerous-subprocess-use
    subprocess.run(["env", "sh", "-c", "/bin/ls"])

    # ok:dangerous-subprocess-use
    subprocess.run(["python3", "-c", "print('hello')"])

    # ok:dangerous-subprocess-use
    subprocess.run(["node", "-e", "console.log('hello')"])

    # ok:dangerous-subprocess-use
    subprocess.run(["perl", "-e", "print 'hello'"])

    # ok:dangerous-subprocess-use
    subprocess.run(["task", "-c", "/bin/ls"], executable="/bin/sh")

    # ok:dangerous-subprocess-use
    subprocess.run(args="/bin/ls", shell=True)

    # ok:dangerous-subprocess-use
    subprocess.run(args=["sh", "-c", "/bin/ls"])

    # ok:dangerous-subprocess-use
    subprocess.run(["ls", "-l", route_param])

    return "ok!"
