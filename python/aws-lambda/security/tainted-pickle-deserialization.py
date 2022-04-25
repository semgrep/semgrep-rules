import os
import _pickle


def lambda_handler(event, context):

  # ruleid: tainted-pickle-deserialization
  _pickle.loads(event['exploit_code'])

  # ok: tainted-pickle-deserialization
  _pickle.loads('hardcoded code')
