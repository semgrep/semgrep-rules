# ruleid: python-debugger-found
import pdb

# ruleid: python-debugger-found
pdb.set_trace()


def foo():
    # ok: python-debugger-found
    p = not_pdb.set_trace()
