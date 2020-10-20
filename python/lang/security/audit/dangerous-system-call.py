import os

# ok:dangerous-system-call
os.system("ls -al")

# ok:dangerous-system-call
os.popen("cat contents.txt")

from somewhere import something

# ruleid:dangerous-system-call
os.system(something())

# ruleid:dangerous-system-call
os.popen(something())

# ruleid:dangerous-system-call
os.popen2(something())
