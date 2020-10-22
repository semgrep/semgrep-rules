# cf. https://github.com/PyCQA/bandit/blob/b1411bfb43795d3ffd268bef17a839dee954c2b1/bandit/plugins/injection_wildcard.py

import os as o
import subprocess as subp

# Vulnerable to wildcard injection
# ruleid:system-wildcard-detected
o.system("/bin/tar xvzf *")
# ruleid:system-wildcard-detected
o.system('/bin/chown *')
# ruleid:system-wildcard-detected
o.popen2('/bin/chmod *')
# ruleid:system-wildcard-detected
subp.Popen('/bin/chown *', shell=True)

# Not vulnerable to wildcard injection
# ok:system-wildcard-detected
subp.Popen('/bin/rsync *')
# ok:system-wildcard-detected
subp.Popen("/bin/chmod *")
# ok:system-wildcard-detected
subp.Popen(['/bin/chown', '*'])
# ok:system-wildcard-detected
subp.Popen(["/bin/chmod", sys.argv[1], "*"],
                 stdin=subprocess.PIPE, stdout=subprocess.PIPE)
# ok:system-wildcard-detected
o.spawnvp(os.P_WAIT, 'tar', ['tar', 'xvzf', '*'])
