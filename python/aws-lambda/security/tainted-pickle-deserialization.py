import _pickle
import cPickle
import shelve

import dill as securedill
from dill import load, loads


def lambda_handler(event, context):

    tainted = event['exploit_code']
    s = "encoded-data"
    b = bytearray().extend(map(ord,string))

    # ruleid: tainted-pickle-deserialization
    _pickle.load(event['exploit_code'])

    # ruleid: tainted-pickle-deserialization
    obj = cPickle.loads(f"foobar{event['exploit_code']}")

    # ruleid: tainted-pickle-deserialization
    loads(event['exploit_code'])(123)

    # ruleid: tainted-pickle-deserialization
    with shelve.open(f"/tmp/path/{event['object_path']}") as db:
      db['eggs'] = 'eggs'

    # ok: tainted-pickle-deserialization
    _pickle.loads('hardcoded code')

    # ok: tainted-pickle-deserialization
    code = '/file/path'
    cPickle.load(code)

    # ok: tainted-pickle-deserialization
    name = 'foobar'
    shelve.open(f"/tmp/path/{name}")

    # ruleid: tainted-pickle-deserialization
    dill.load(tainted)
    # ruleid: tainted-pickle-deserialization
    dill.loads(tainted)

    # ok: tainted-pickle-deserialization
    dill.load(s)
    # ok: tainted-pickle-deserialization
    dill.loads(b)

    # ruleid: tainted-pickle-deserialization
    securedill.load(tainted)
    # ruleid: tainted-pickle-deserialization
    securedill.loads(tainted)

    # ok: tainted-pickle-deserialization
    securedill.load(s)
    # ok: tainted-pickle-deserialization
    securedill.loads(b)

    # ruleid: tainted-pickle-deserialization
    load(tainted)
    # ruleid: tainted-pickle-deserialization
    loads(tainted)

    # ok: tainted-pickle-deserialization
    load(s)
    # ok: tainted-pickle-deserialization
    loads(b)
