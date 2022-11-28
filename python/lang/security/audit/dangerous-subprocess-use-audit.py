# cf. https://github.com/returntocorp/semgrep/blob/develop/docs/writing_rules/examples.md#auditing-dangerous-function-use

import subprocess
import sys

# ok:dangerous-subprocess-use-audit
subprocess.call("echo 'hello'")

# ok:dangerous-subprocess-use-audit
subprocess.call(["echo", "a", ";", "rm", "-rf", "/"])

# ok:dangerous-subprocess-use-audit
subprocess.call(("echo", "a", ";", "rm", "-rf", "/"))

# ok:dangerous-subprocess-use-audit
raise subprocess.CalledProcessError("{}".format("foo"))

# ok:dangerous-subprocess-use-audit
raise subprocess.SubprocessError("{}".format("foo"))

# ruleid:dangerous-subprocess-use-audit
subprocess.call("grep -R {} .".format(sys.argv[1]))

def foobar(user_input):
  cmd = user_input.split()
  # ruleid:dangerous-subprocess-use-audit
  subprocess.call([cmd[0], cmd[1], "some", "args"])

# ruleid:dangerous-subprocess-use-audit
subprocess.call("grep -R {} .".format(sys.argv[1]), shell=True)

# ruleid:dangerous-subprocess-use-audit
subprocess.call("grep -R {} .".format(sys.argv[1]), shell=True, cwd="/home/user")

# ruleid:dangerous-subprocess-use-audit
subprocess.run("grep -R {} .".format(sys.argv[1]), shell=True)

# ruleid:dangerous-subprocess-use-audit
subprocess.run(["bash", "-c", sys.argv[1]], shell=True)

def vuln_payload(payload: str) -> None:
  with tempfile.TemporaryDirectory() as directory:
    python_file = Path(directory) / "hello_world.py"
    python_file.write_text(textwrap.dedent("""
        print("What is your name?")
        name = input()
        print("Hello " + name)
    """))
    # ruleid:dangerous-subprocess-use-audit
    program = subprocess.Popen(['python2', str(python_file)], stdin=subprocess.PIPE, text=True)
    program.communicate(input=payload, timeout=1)
