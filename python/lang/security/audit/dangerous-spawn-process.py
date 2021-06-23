import os

# ok:dangerous-spawn-process
os.execl("ls")

# ok:dangerous-spawn-process
os.spawnlp(os.P_WAIT, "ls")

# ok:dangerous-spawn-process
os.spawnlpe(os.P_WAIT, "ls")

# ok:dangerous-spawn-process
os.spawnv(os.P_WAIT, "/bin/ls")

# ok:dangerous-spawn-process
os.spawnve(os.P_WAIT, "/bin/ls", ["-a"], os.environ)

from somewhere import something

# ruleid:dangerous-spawn-process
os.execl(something())

# ruleid:dangerous-spawn-process
os.execv('/bin/bash', ['-c', something()])

# ruleid:dangerous-spawn-process
os.spawnlp(os.P_WAIT, something())

# ruleid:dangerous-spawn-process
os.spawnlpe(os.P_WAIT, something())

# ruleid:dangerous-spawn-process
os.spawnv(os.P_WAIT, something())

# ruleid:dangerous-spawn-process
os.spawnve(os.P_WAIT, something(), ["-a"], os.environ)

# ruleid:dangerous-spawn-process
os.spawnve(os.P_WAIT, "/bin/bash", ["-c", something()], os.environ)

def run_payload(shell_command: str) -> None:
    args = shlex.split(shell_command)
    path = args[0]
    # ruleid:dangerous-spawn-process
    pid = os.posix_spawn(path, args, os.environ)
    os.waitpid(pid, 0)
