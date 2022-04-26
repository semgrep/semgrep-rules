import _pickle
import cPickle
from dill import loads
import shelve


def lambda_handler(event, context):

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
