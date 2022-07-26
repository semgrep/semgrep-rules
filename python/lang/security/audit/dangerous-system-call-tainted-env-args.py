import os

# ok:dangerous-system-call-tainted-env-args
os.system("ls -al")

# ok:dangerous-system-call-tainted-env-args
os.popen("cat contents.txt")

from somewhere import something

# fn:dangerous-system-call-tainted-env-args
os.system(something())

# fn:dangerous-system-call-tainted-env-args
os.popen(something())

# fn:dangerous-system-call-tainted-env-args
os.popen2(something())


# Environment true positives
def env1():
    envvar1 = os.environ["envvar"]

    # ruleid:dangerous-system-call-tainted-env-args
    os.system(envvar1)
    # ruleid:dangerous-system-call-tainted-env-args
    os.popen(envvar1)
    # ruleid:dangerous-system-call-tainted-env-args
    os.popen2(envvar1)

    envvar2 = os.environ.get("envvar")

    # ruleid:dangerous-system-call-tainted-env-args
    os.system(envvar2)
    # ruleid:dangerous-system-call-tainted-env-args
    os.popen(envvar2)
    # ruleid:dangerous-system-call-tainted-env-args
    os.popen2(envvar2)

    envvar3 = os.getenv("envvar")

    # ruleid:dangerous-system-call-tainted-env-args
    os.system(envvar3)
    # ruleid:dangerous-system-call-tainted-env-args
    os.popen(envvar3)
    # ruleid:dangerous-system-call-tainted-env-args
    os.popen2(envvar3)


# Cmd line args
import argparse


def args1():
    parser = argparse.ArgumentParser(description="Oops!")
    parser.add_argument("arg1", type=str)
    args = parser.parse_args()
    arg1 = args.arg1

    # ruleid:dangerous-system-call-tainted-env-args
    os.system(arg1)
    # ruleid:dangerous-system-call-tainted-env-args
    os.popen(arg1)
    # ruleid:dangerous-system-call-tainted-env-args
    os.popen2(arg1)


import optparse


def args2():
    parser = optparse.OptionParser()
    parser.add_option(
        "-f", "--file", dest="filename", help="write report to FILE", metavar="FILE"
    )
    (opts, args) = parser.parse_args()

    opt1 = opts.opt1
    # ruleid:dangerous-system-call-tainted-env-args
    os.system(opt1)
    # ruleid:dangerous-system-call-tainted-env-args
    os.popen(opt1)
    # ruleid:dangerous-system-call-tainted-env-args
    os.popen2(opt1)

    arg1 = args.arg1
    # ruleid:dangerous-system-call-tainted-env-args
    os.system(arg1)
    # ruleid:dangerous-system-call-tainted-env-args
    os.popen(arg1)
    # ruleid:dangerous-system-call-tainted-env-args
    os.popen2(arg1)


import getopt
import sys


def args3():
    opts, args = getopt.getopt(
        sys.argv[1:],
        "hl:p:",
        ["help", "local_path", "parameter"],
    )

    for opt, arg in opts:
        # ruleid:dangerous-system-call-tainted-env-args
        os.system(arg)
        # ruleid:dangerous-system-call-tainted-env-args
        os.popen(arg)
        # ruleid:dangerous-system-call-tainted-env-args
        os.popen2(arg)

        # ok:dangerous-system-call-tainted-env-args
        os.system(opt)
        # ok:dangerous-system-call-tainted-env-args
        os.popen(opt)
        # ok:dangerous-system-call-tainted-env-args
        os.popen2(opt)

    for arg in args:
        # ruleid:dangerous-system-call-tainted-env-args
        os.system(arg)
        # ruleid:dangerous-system-call-tainted-env-args
        os.popen(arg)
        # ruleid:dangerous-system-call-tainted-env-args
        os.popen2(arg)


def args4():
    arg1 = sys.argv[1]
    # ruleid:dangerous-system-call-tainted-env-args
    os.system(arg1)
    # ruleid:dangerous-system-call-tainted-env-args
    os.popen(arg1)
    # ruleid:dangerous-system-call-tainted-env-args
    os.popen2(arg1)

    arg2 = sys.argv[2]
    # ruleid:dangerous-system-call-tainted-env-args
    os.system(arg2)
    # ruleid:dangerous-system-call-tainted-env-args
    os.popen(arg2)
    # ruleid:dangerous-system-call-tainted-env-args
    os.popen2(arg2)


def open_url(url, wait=False, locate=False):
    import subprocess

    if WIN:
        url = url.replace('"', "")
        wait = "/WAIT" if wait else ""
        args = f'start {wait} "" "{url}"'
        return os.system(args)
