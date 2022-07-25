import os

# ok:dangerous-system-call-audit
os.system("ls -al")

# ok:dangerous-system-call-audit
os.popen("cat contents.txt")

from somewhere import something

# ruleid:dangerous-system-call-audit
os.system(something())

# ruleid:dangerous-system-call-audit
getattr(os, "system")(something())

# ruleid:dangerous-system-call-audit
dynamic_system_by_static_os = getattr(os, "system")
dynamic_system_by_static_os(something())

# ruleid:dangerous-system-call-audit
__import__("os").system(something())

# ruleid:dangerous-system-call-audit
getattr(__import__("os"), "system")(something())

# ruleid:dangerous-system-call-audit
dynamic_os = __import__("os")
dynamic_os.system(something())

# ruleid:dangerous-system-call-audit
dynamic_os = __import__("os")
getattr(dynamic_os, "system")(something())

# ruleid:dangerous-system-call-audit
dynamic_os = __import__("os")
dynamic_system = getattr(dynamic_os, "system")
dynamic_system(something())

# ruleid:dangerous-system-call-audit
os.popen(something())

# ruleid:dangerous-system-call-audit
os.popen2(something())
