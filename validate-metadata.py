import logging
import sys
import yaml

from jsonschema import validate as schema_validate
from jsonschema.validators import Draft7Validator

logger = logging.getLogger(__file__)
logger.setLevel(logging.INFO)
handler = logging.StreamHandler(stream=sys.stderr)
logger.addHandler(handler)

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    # Add arguments here
    parser.add_argument("--config", "-f")
    parser.add_argument("--schema", "-s")

    args = parser.parse_args()

    with open(args.config) as fin:
        config = yaml.safe_load(fin)

    with open(args.schema) as fin:
        contents = yaml.safe_load(fin) 
        schema = contents['schema']

    Draft7Validator.check_schema(schema)

    metadata = config['rules'][0]['metadata']
    schema_validate(metadata, schema, cls=Draft7Validator)
