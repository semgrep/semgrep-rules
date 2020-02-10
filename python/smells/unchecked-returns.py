import subprocess as sub

# ok
x = sub.call('foo')

# ruleid: unchecked-subprocess-call
sub.call('foo')

# OK
sub.check_call('foo')