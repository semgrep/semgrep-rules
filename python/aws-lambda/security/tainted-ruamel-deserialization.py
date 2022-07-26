import yaml

def lambda_handler(event, context):

  #ruleid:tainted-pyyaml-deserialization
  yaml.load(event['exploit_code'])

  #ruleid:tainted-pyyaml-deserialization
  yaml.load_all(f"foobar{event['exploit_code']}")

  #ruleid:tainted-pyyaml-deserialization
  yaml.load(event['exploit_code'], **kwargs)

  #ok:tainted-pyyaml-deserialization
  yaml.load_all(f"foobar{event['exploit_code']}", Loader=yaml.CSafeLoader)

  #ok:tainted-pyyaml-deserialization
  yaml.load(event['exploit_code'], Loader=yaml.SafeLoader)
