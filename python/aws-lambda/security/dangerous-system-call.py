import os

def handler(event, context):
    # ok: dangerous-system-call
    os.system("ls -al")

    # ok: dangerous-system-call
    os.popen("cat contents.txt")

    # ruleid: dangerous-system-call
    os.system(f"ls -la {event['dir']}")