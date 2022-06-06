import os
import sys
from somewhere import something

# ok:dangerous-taint-os-exec
os.execl("/foo/bar", "/foo/bar")

# ok:dangerous-taint-os-exec
os.execv("/foo/bar", ["/foo/bar", "-a", "-b"])

cmd = something()
# fn:dangerous-taint-os-exec
os.execl(cmd, cmd, "--do-smth")

# fn:dangerous-taint-os-exec
os.execve("/bin/bash", ["/bin/bash", "-c", something()], os.environ)

# fn:dangerous-taint-os-exec
os.execl("/bin/bash", "/bin/bash", "-c", something())

cmd = sys.argv[2]
# ruleid:dangerous-taint-os-exec
os.execl("/bin/bash", "/bin/bash", "-c", cmd)
