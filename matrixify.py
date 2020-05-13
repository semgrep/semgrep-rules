import logging
import sys

from collections import defaultdict
from typing import Dict, List, Set, Any

logger = logging.getLogger(__file__)
logger.setLevel(logging.DEBUG)
handler = logging.StreamHandler(stream=sys.stderr)
handler.setFormatter(logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s'))
logger.addHandler(handler)

LANGS = (
    "python",
    "javascript",
    "java",
    "go",
)


def get_owasp(rule: Dict[str, Any]) -> str:
    return rule.get("metadata", {}).get("owasp", "")

def get_cwe(rule: Dict[str, Any]) -> str:
    return rule.get("metadata", {}).get("cwe", "")

def get_lang(path: str) -> str:
    for lang in LANGS:
        if lang in path:
            return lang
    return ""

def is_security(path: str) -> bool:
    return "security" in path

def is_rule(path: str) -> bool:
    _, ext = os.path.splitext(path)
    return "yaml" in ext 

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    # Add arguments here
    parser.add_argument("directory")

    args = parser.parse_args()

    import yaml
    import os

    owasp_matrix = defaultdict(list)
    cwe_matrix = defaultdict(list)
    owasp_by_lang_matrix = defaultdict(lambda: defaultdict(list))
    cwe_by_lang_matrix = defaultdict(lambda: defaultdict(list))
    for dirpath, dirnames, filenames in os.walk(args.directory):
        for filename in filenames:
            path = os.path.join(dirpath, filename)
            if not is_rule(path):
                continue
            if not is_security(path):
                continue
            logger.debug(f"Opening {path}")
            with open(path, 'r') as fin:
                rules = yaml.safe_load(fin)
                for rule in rules.get('rules', []):
                    lang = get_lang(path)
                    cwe = get_cwe(rule)
                    owasp = get_owasp(rule)
                    owasp_matrix[owasp].append((path, rule))
                    cwe_matrix[cwe].append((path, rule))
                    owasp_by_lang_matrix[owasp][lang].append((path, rule))
                    cwe_by_lang_matrix[cwe][lang].append((path, rule))
    import json

    print(json.dumps({
        "owasp": {k: len(v) for k, v in sorted(owasp_matrix.items())},
        "cwe": {k: len(v) for k, v in sorted(cwe_matrix.items())},
        "owasp_by_language": {k: {k2: len(v) for k2, v in owasp_by_lang_matrix[k].items()} for k in sorted(owasp_by_lang_matrix)},
        "cwe_by_language": {k: {k2: len(v) for k2, v in cwe_by_lang_matrix[k].items()} for k in sorted(cwe_by_lang_matrix)},
        "rules_with_no_owasp": [t[0] for t in owasp_matrix[""]],
        "rules_with_no_cwe": [t[0] for t in cwe_matrix[""]],
    }))