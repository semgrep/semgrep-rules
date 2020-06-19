import subprocess as sub
import subprocess

# ok
x = sub.call('foo')

# ruleid: unchecked-subprocess-call
sub.call('foo')

# OK
sub.check_call('foo')

# OK
sub.check_call('foo ') == 0

def foo():
    # ok
    return subprocess.call(['ls', '--no'])
    
def foo():
    # ruleid: unchecked-subprocess-call
    subprocess.call(['ls', '--no'])
    return True


def foo2():
    return subprocess.call(['ls', '--no']) == 0