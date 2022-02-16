import subprocess
import sys

def handler(event, context):
  # ok:dangerous-subprocess-use
  subprocess.call("echo 'hello'")

  # ok:dangerous-subprocess-use
  subprocess.call(["echo", "a", ";", "rm", "-rf", "/"])

  # ruleid:dangerous-subprocess-use
  subprocess.call("grep -R {} .".format(event['id']))

  cmd = event['id'].split()
  # ruleid:dangerous-subprocess-use
  subprocess.call([cmd[0], cmd[1], "some", "args"])

  # ruleid:dangerous-subprocess-use
  subprocess.call("grep -R {} .".format(event['id']), shell=True)

  # ruleid:dangerous-subprocess-use
  subprocess.call("grep -R {} .".format(event['id']), shell=True, cwd="/home/user")

  # ruleid:dangerous-subprocess-use
  subprocess.run("grep -R {} .".format(event['id']), shell=True)

  # ruleid:dangerous-subprocess-use
  subprocess.run(["bash", "-c", event['id']], shell=True)

  python_file = f"""
      print("What is your name?")
      name = input()
      print("Hello " + {event['id']})
  """
  # ruleid:dangerous-subprocess-use
  program = subprocess.Popen(['python2', python_file], stdin=subprocess.PIPE, text=True)
  program.communicate(input=payload, timeout=1)
