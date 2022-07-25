import os
from somewhere import something

# ok:dangerous-os-exec-audit
os.execl("/foo/bar", "/foo/bar")

# ok:dangerous-os-exec-audit
os.execv("/foo/bar", ["/foo/bar", "-a", "-b"])

cmd = something()
# ruleid:dangerous-os-exec-audit
os.execl(cmd, cmd, '--do-smth')

# ruleid:dangerous-os-exec-audit
os.execve("/bin/bash", ["/bin/bash", "-c", something()], os.environ)

# ruleid:dangerous-os-exec-audit
os.execl("/bin/bash", "/bin/bash", "-c", something())
