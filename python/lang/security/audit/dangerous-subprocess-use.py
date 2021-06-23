# cf. https://github.com/returntocorp/semgrep/blob/develop/docs/writing_rules/examples.md#auditing-dangerous-function-use

import subprocess
import sys

# ok:dangerous-subprocess-use
subprocess.call("echo 'hello'")

# ok:dangerous-subprocess-use
subprocess.call(["echo", "a", ";", "rm", "-rf", "/"])

# ok:dangerous-subprocess-use
raise subprocess.CalledProcessError("{}".format("foo"))

# ok:dangerous-subprocess-use
raise subprocess.SubprocessError("{}".format("foo"))

# ruleid:dangerous-subprocess-use
subprocess.call("grep -R {} .".format(sys.argv[1]))

def foobar(user_input):
  cmd = user_input.split()
  # ruleid:dangerous-subprocess-use
  subprocess.call([cmd[0], cmd[1], "some", "args"])

# ruleid:dangerous-subprocess-use
subprocess.call("grep -R {} .".format(sys.argv[1]), shell=True)

# ruleid:dangerous-subprocess-use
subprocess.call("grep -R {} .".format(sys.argv[1]), shell=True, cwd="/home/user")

# ruleid:dangerous-subprocess-use
subprocess.run("grep -R {} .".format(sys.argv[1]), shell=True)

# ruleid:dangerous-subprocess-use
subprocess.run(["bash", "-c", sys.argv[1]], shell=True)
