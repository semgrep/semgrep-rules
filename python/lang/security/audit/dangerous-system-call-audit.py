import os

# ok:dangerous-system-call-audit
os.system("ls -al")

# ok:dangerous-system-call-audit
os.popen("cat contents.txt")

from somewhere import something

# ruleid:dangerous-system-call-audit
os.system(something())

# ruleid:dangerous-system-call-audit
os.popen(something())

# ruleid:dangerous-system-call-audit
os.popen2(something())
