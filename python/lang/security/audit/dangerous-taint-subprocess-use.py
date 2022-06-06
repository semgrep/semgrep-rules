# cf. https://github.com/returntocorp/semgrep/blob/develop/docs/writing_rules/examples.md#auditing-dangerous-function-use

import subprocess
import sys


def ok():
    # ok:dangerous-taint-subprocess-use
    subprocess.call("echo 'hello'")

    # ok:dangerous-taint-subprocess-use
    subprocess.call(["echo", "a", ";", "rm", "-rf", "/"])

    # ok:dangerous-taint-subprocess-use
    raise subprocess.CalledProcessError("{}".format("foo"))

    # ok:dangerous-taint-subprocess-use
    raise subprocess.SubprocessError("{}".format("foo"))


def bad1():
    cmd = sys.argv[1]
    # ruleid:dangerous-taint-subprocess-use
    subprocess.call(cmd)


def bad2():
    # ruleid:dangerous-taint-subprocess-use
    subprocess.call("grep -R {} .".format(sys.argv[1]))


def bad3():
    # ruleid:dangerous-taint-subprocess-use
    subprocess.call("grep -R {} .".format(sys.argv[1]), shell=True)


def bad4():
    # ruleid:dangerous-taint-subprocess-use
    subprocess.call("grep -R {} .".format(sys.argv[1]), shell=True, cwd="/home/user")


def bad5():
    # ruleid:dangerous-taint-subprocess-use
    subprocess.run("grep -R {} .".format(sys.argv[1]), shell=True)


def bad6():
    # ruleid:dangerous-taint-subprocess-use
    subprocess.run(["bash", "-c", sys.argv[1]], shell=True)


def bad7():
    cmd = sys.argv[1]
    # ruleid:dangerous-taint-subprocess-use
    subprocess.call([cmd[0], cmd[1], "some", "args"])


def fn1(user_input):
    cmd = user_input.split()
    # fn:dangerous-taint-subprocess-use
    subprocess.call([cmd[0], cmd[1], "some", "args"])


def fn2(payload: str) -> None:
    with tempfile.TemporaryDirectory() as directory:
        python_file = Path(directory) / "hello_world.py"
        python_file.write_text(
            textwrap.dedent(
                """
        print("What is your name?")
        name = input()
        print("Hello " + name)
    """
            )
        )
        # fn:dangerous-taint-subprocess-use
        program = subprocess.Popen(
            ["python2", str(python_file)], stdin=subprocess.PIPE, text=True
        )
        program.communicate(input=payload, timeout=1)
