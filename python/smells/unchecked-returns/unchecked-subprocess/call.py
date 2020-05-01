#!/usr/bin/python

def foo():
    # ruleid: r2c.python.smells.unchecked-returns.unchecked-subprocess-call
    return subprocess.call(['ls', '--no'])
    
def foo():
    return subprocess.call(['ls', '--no']) == 0