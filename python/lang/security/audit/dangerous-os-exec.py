import os
from somewhere import something

# ok:dangerous-os-exec
os.execl("/foo/bar", "/foo/bar")

# ok:dangerous-os-exec
os.execv("/foo/bar", ["/foo/bar", "-a", "-b"])

cmd = something()
# ruleid:dangerous-os-exec
os.execl(cmd, cmd, '--do-smth')

# ruleid:dangerous-os-exec
os.execve("/bin/bash", ["/bin/bash", "-c", something()], os.environ)

# ruleid:dangerous-os-exec
os.execl("/bin/bash", "/bin/bash", "-c", something())
