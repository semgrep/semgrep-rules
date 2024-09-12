import subprocess
import sys
import shlex

def handler(event, context):
  # ok:dangerous-subprocess-use
  subprocess.call("echo 'hello'")

  # ok:dangerous-subprocess-use
  subprocess.call(["echo", "a", ";", "rm", "-rf", "/"])

  # ruleid:dangerous-subprocess-use
  subprocess.call("grep -R {} .".format(event['id']), shell=True)

  # ok:dangerous-subprocess-use
  subprocess.call("grep -R {} .".format(event['id']))

  cmd = event['id'].split()
  # ok:dangerous-subprocess-use
  subprocess.call([cmd[0], cmd[1], "some", "args"])

  # ruleid:dangerous-subprocess-use
  subprocess.call([cmd[0], cmd[1], "some", "args"], shell=True)

  # ruleid:dangerous-subprocess-use
  subprocess.call("grep -R {} .".format(event['id']), shell=True)

  # ruleid:dangerous-subprocess-use
  subprocess.call("grep -R {} .".format(event['id']), shell=True, cwd="/home/user")

  python_file = f"""
      print("What is your name?")
      name = input()
      print("Hello " + {event['id']})
  """
  # ok:dangerous-subprocess-use
  program = subprocess.Popen(['python2', python_file], stdin=subprocess.PIPE, text=True)

  # ruleid:dangerous-subprocess-use
  program = subprocess.Popen(['python2', python_file], stdin=subprocess.PIPE, text=True, shell=True)

  # ruleid:dangerous-subprocess-use
  program = subprocess.Popen(['python2', python_file], stdin=subprocess.PIPE, shell=True, text=True)

  # ok:dangerous-subprocess-use
  program = subprocess.Popen(['python2', shlex.quote(python_file)], stdin=subprocess.PIPE, shell=True, text=True)

  program.communicate(input=payload, timeout=1)
