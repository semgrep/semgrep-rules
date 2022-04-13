import os
import shlex
from somewhere import something

def handler(event, context):
    # ok:dangerous-spawn-process
    os.spawnlp(os.P_WAIT, "ls")

    # ok:dangerous-spawn-process
    os.spawnlpe(os.P_WAIT, "ls")

    # ok:dangerous-spawn-process
    os.spawnv(os.P_WAIT, "/bin/ls")

    # ok:dangerous-spawn-process
    os.spawnve(os.P_WAIT, "/bin/ls", ["-a"], os.environ)

    # ruleid:dangerous-spawn-process
    os.spawnlp(os.P_WAIT, event['cmd'])

    # ruleid:dangerous-spawn-process
    os.spawnlpe(os.P_WAIT, event['cmd'])

    # ruleid:dangerous-spawn-process
    os.spawnv(os.P_WAIT, f"foo-{event['cmd']}")

    # ruleid:dangerous-spawn-process
    os.spawnve(os.P_WAIT, event['cmd'], ["-a"], os.environ)

    # ruleid:dangerous-spawn-process
    os.spawnve(os.P_WAIT, "/bin/bash", ["-c", f"ls -la {event['cmd']}"], os.environ)

    # ruleid:dangerous-spawn-process
    os.spawnl(os.P_WAIT, "/bin/bash", "-c", f"ls -la {event['cmd']}")

    # ruleid:dangerous-spawn-process
    os.spawnl(os.P_WAIT, "/bin/bash", "-c", event['cmd'])
