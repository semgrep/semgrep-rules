import jsonpickle

def lambda_handler(event, context):

  # ruleid: tainted-jsonpickle-deserialization
  jsonpickle.decode(event['exploit_code'])

  # ruleid: tainted-jsonpickle-deserialization
  obj = jsonpickle.decode(f"foobar{event['exploit_code']}")

  # ok: tainted-jsonpickle-deserialization
  jsonpickle.decode('hardcoded code')

  # ok: tainted-jsonpickle-deserialization
  code = '/file/path'
  jsonpickle.decode(code)
