import os
import shlex
import sys
from somewhere import something

# ok:dangerous-spawn-process-tainted-env-args
os.spawnlp(os.P_WAIT, "ls")

# ok:dangerous-spawn-process-tainted-env-args
os.spawnlpe(os.P_WAIT, "ls")

# ok:dangerous-spawn-process-tainted-env-args
os.spawnv(os.P_WAIT, "/bin/ls")

# ok:dangerous-spawn-process-tainted-env-args
os.spawnve(os.P_WAIT, "/bin/ls", ["-a"], os.environ)

# fn:dangerous-spawn-process-tainted-env-args
os.spawnlp(os.P_WAIT, something())

# fn:dangerous-spawn-process-tainted-env-args
os.spawnlpe(os.P_WAIT, something())

# fn:dangerous-spawn-process-tainted-env-args
os.spawnv(os.P_WAIT, something())

# fn:dangerous-spawn-process-tainted-env-args
os.spawnve(os.P_WAIT, something(), ["-a"], os.environ)

# fn:dangerous-spawn-process-tainted-env-args
os.spawnve(os.P_WAIT, "/bin/bash", ["-c", something()], os.environ)

# fn:dangerous-spawn-process-tainted-env-args
os.spawnl(os.P_WAIT, "/bin/bash", "-c", something())


def run_payload(shell_command: str) -> None:
    args = shlex.split(shell_command)
    path = args[0]
    # fn:dangerous-spawn-process-tainted-env-args
    pid = os.posix_spawn(path, args, os.environ)
    os.waitpid(pid, 0)


cmd = sys.argv[2]

# ruleid:dangerous-spawn-process-tainted-env-args
os.spawnlp(os.P_WAIT, cmd)

# ruleid:dangerous-spawn-process-tainted-env-args
os.spawnlpe(os.P_WAIT, cmd)

# ruleid:dangerous-spawn-process-tainted-env-args
os.spawnv(os.P_WAIT, cmd)

# ruleid:dangerous-spawn-process-tainted-env-args
os.spawnve(os.P_WAIT, cmd, ["-a"], os.environ)

# ruleid:dangerous-spawn-process-tainted-env-args
os.spawnve(os.P_WAIT, "/bin/bash", ["-c", cmd], os.environ)

# ruleid:dangerous-spawn-process-tainted-env-args
os.spawnl(os.P_WAIT, "/bin/bash", "-c", cmd)


def run_payload() -> None:
    shell_command = sys.argv[2]
    args = shlex.split(shell_command)
    path = args[0]
    # ruleid:dangerous-spawn-process-tainted-env-args
    pid = os.posix_spawn(path, args, os.environ)
    os.waitpid(pid, 0)
