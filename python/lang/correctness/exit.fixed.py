import sys

if False:
    # ok: use-sys-exit
    sys.exit(2)

if True:
    # ruleid: use-sys-exit
    sys.exit(3)

def check_db(user):
    if user is None:
        # ruleid: use-sys-exit
        sys.exit(4)
    else:
        print(user)
        # ok: use-sys-exit
        sys.exit(0)

if False:
    # ok: use-sys-exit
    from sys import exit

    exit(0)
