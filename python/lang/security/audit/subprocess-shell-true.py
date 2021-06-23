import subprocess
import sys

# ok:subprocess-shell-true
subprocess.call("echo 'hello'")

# ok:subprocess-shell-true
subprocess.call("grep -R {} .".format(sys.argv[1]))

# ok:subprocess-shell-true
subprocess.call("echo 'hello'", shell=True)

# ruleid:subprocess-shell-true
subprocess.call("grep -R {} .".format(sys.argv[1]), shell=True)

# ruleid:subprocess-shell-true
subprocess.call("grep -R {} .".format(sys.argv[1]), shell=True, cwd="/home/user")

# ruleid:subprocess-shell-true
subprocess.run("grep -R {} .".format(sys.argv[1]), shell=True)
