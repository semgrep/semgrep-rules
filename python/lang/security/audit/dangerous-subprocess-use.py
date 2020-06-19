# cf. https://github.com/returntocorp/semgrep/blob/develop/docs/writing_rules/examples.md#auditing-dangerous-function-use

import subprocess
import sys

subprocess.call("echo 'hello'") # Doesn't match

subprocess.call("grep -R {} .".format(sys.argv[1])) # Doesn't match

# ruleid:dangerous-subprocess-use
subprocess.call("grep -R {} .".format(sys.argv[1]), shell=True) # Matches here

# ruleid:dangerous-subprocess-use
subprocess.call("grep -R {} .".format(sys.argv[1]), shell=True, cwd="/home/user") # Matches here

# ruleid:dangerous-subprocess-use
subprocess.run("grep -R {} .".format(sys.argv[1]), shell=True) # Matches here too!