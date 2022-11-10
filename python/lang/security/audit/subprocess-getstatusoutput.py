import sys
import subprocess

# ok:subprocess-getstatusoutput
subprocess.getstatusoutput("echo 'hello'")

# ruleid:subprocess-getstatusoutput
subprocess.getstatusoutput("grep -R {} .".format(sys.argv[1]))

