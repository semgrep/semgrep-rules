import json
import subprocess
import sys
import django

def a(request):
    ip = request.POST.get("ip")
    # ruleid:subprocess-injection
    subprocess.run("ping "+ ip)

def b(request):
    host = request.headers["HOST"]
    # ruleid:subprocess-injection
    subprocess.run("echo {} > log".format(host))

def d(request):
    cmd = request.POST.get("cmd")
    ip = request.POST.get("ip")
    command = [cmd, ip]
    # ruleid:subprocess-injection
    subprocess.capture_output(command)

def e(request):
    event = json.loads(request.body)
    cmd = event['id'].split()
    # ruleid:subprocess-injection
    subprocess.call([cmd[0], cmd[1], "some", "args"])

def f(request):
    event = json.loads(request.body)
    # ruleid:subprocess-injection
    subprocess.run(["bash", "-c", event['id']], shell=True)

def g(request):
    event = request.body
    python_file = f"""
        print("What is your name?")
        name = input()
        print("Hello " + {event['id']})
    """
    # ruleid:subprocess-injection
    program = subprocess.Popen(['python2', python_file], stdin=subprocess.PIPE, text=True)
    program.communicate(input=payload, timeout=1)

def d_ok(request):
    # ok:subprocess-injection
    cmd = request.POST.get("cmd")
    ip = request.POST.get("ip")
    subprocess.capture_output(["ping", cmd, ip])

def d_ok2(request):
    ip = request.POST.get("ip")
    cmd = ["ping", ip]
    # ok:subprocess-injection
    subprocess.capture_output(cmd)

def e_ok(request):
    allowed = {'p': "ping"}

    event = json.loads(request.body)
    cmd = event['id'].split()

    valid = allowed[cmd[0]]
    # ok:subprocess-injection
    subprocess.call([valid, "some", "args"])

def ok(request):
    ip = request.POST.get("ip")
    # ok:subprocess-injection
    subprocess.run(["ping", ip])

def ok2(request):
    ip = request.POST.get("ip")
    # ok:subprocess-injection
    subprocess.run("echo 'nothing'")

def ok3(request):
    ip = request.POST.get("ip")
    # ok:subprocess-injection
    subprocess.call(["echo", "a", ";", "rm", "-rf", "/"])



