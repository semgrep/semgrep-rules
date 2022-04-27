import logging
import sys
import yaml
from pathlib import Path

from jsonschema import validate as schema_validate
from jsonschema.exceptions import ValidationError
from jsonschema.validators import Draft7Validator

logger = logging.getLogger(__file__)
logger.setLevel(logging.INFO)
handler = logging.StreamHandler(stream=sys.stderr)
logger.addHandler(handler)


class RegistryMetadataValidator(Draft7Validator):

    required_property_messages = {
        "references": "Please include at least one URL with more information about this rule in a metadata field called 'references'.",
        "technology": "Please include a metadata field called 'technology' that is a list of relevent tech stacks. For example: [python, flask], or [javascript, jwt].",
        "category": "Please include a metadata field called 'technology' that is one of {self.category_enum}",
        "owasp": "Please include an 'owasp' metadata field for security rules. Format: Ann:yyyy, where nn is the OWASP top ten number and yyyy is the OWASP top ten year. See https://owasp.org/Top10/ for more info.",
        "cwe": "Please include a 'cwe' metadata field for security rules. Format: CWE-nnn, where nnn is the CWE number. See https://cwe.mitre.org/ for more info.",
    }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.category_enum = self.schema.get('properties', {}).get('category', {}).get('enum', [])

    def _extend_message(self, error):
        if error.message.endswith("is a required property"):
            prop = error.message[error.message.find("'") + 1 : error.message.rfind("'")]
            extended_message = self.required_property_messages.get(prop)
            error.message = (
                error.message
                if not extended_message
                else f"{error.message}. {extended_message}"
            )

    def validate(self, instance):
        """
        Override validate method to provide useful error messages for required properties.
        """
        try:
            super().validate(instance, self.schema)
        except ValidationError as ve:
            self._extend_message(ve)
            raise ve

    def get_errors(self, instance):
        errors = list(self.iter_errors(instance))
        for error in errors:
            self._extend_message(error)
        return errors


def validate_config_file_metadata(config_path, validator, invalid_configs=None):
    with open(config_path) as fin:
        config = yaml.safe_load(fin)

    try:
        metadata = config["rules"][0]["metadata"]
    except KeyError:
        logger.warning(f"Could not get metadata for {config_path}")
        return

    if not validator.is_valid(metadata):
        if invalid_configs is not None:
            for ve in validator.get_errors(metadata):
                invalid_configs.append(
                    (
                        str(config_path),
                        ve.validator,
                        ve.absolute_path.pop() if len(ve.absolute_path) else "",
                        ve.message,
                    )
                )
        else:
            logger.warning(f"Invalid config {str(config_path)}: {ve.message}")


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    # Add arguments here
    parser.add_argument("--config", "-f")
    parser.add_argument("--schema", "-s")

    args = parser.parse_args()

    with open(args.schema) as fin:
        contents = yaml.safe_load(fin)
        schema = contents["schema"]

    RegistryMetadataValidator.check_schema(schema)
    v = RegistryMetadataValidator(schema)

    config_path = Path(args.config)
    invalid_configs = []
    if config_path.is_file():
        validate_config_file_metadata(config_path, v, invalid_configs)
    elif config_path.is_dir():
        for config_file in config_path.glob("**/*.yaml"):
            validate_config_file_metadata(config_file, v, invalid_configs)

    if len(invalid_configs) > 0:
        for invalid_config in sorted(invalid_configs, key=lambda t: t[0]):
            print(invalid_config)
        sys.exit(1)
