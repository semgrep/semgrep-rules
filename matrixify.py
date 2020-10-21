#!/usr/bin/python3

import logging
import yaml
import os
import json
import sys

from collections import defaultdict
from typing import Dict, List, Set, Any

logger = logging.getLogger(__file__)
logger.setLevel(logging.DEBUG)
handler = logging.StreamHandler(stream=sys.stderr)
handler.setFormatter(logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s'))
logger.addHandler(handler)

class ArchList(list):
    """
    A list with a .get method that works like dict.get.
    It's also very ancient and has dark magical powers.
    To defeat it you must locate and destroy its phylactery.
    :3
    """

    def get(self, index: int, default=None) -> Any:
        try:
            return super(ArchList, self).__getitem__(index)
        except IndexError:
            return default


def get_owasp(rule: Dict[str, Any]) -> str:
    try:
        return rule.get("metadata", {}).get("owasp", "")
    except AttributeError:
        return ArchList(filter(lambda d: "owasp" in d.keys(), rule.get('metadata'))).get(0, {}).get('owasp', "")
    except Exception:
        logger.warning(f"Could not get owasp for rule {rule.get('id', '')}")
        return ""

def get_cwe(rule: Dict[str, Any]) -> str:
    try:
        return rule.get("metadata", {}).get("cwe", "")
    except AttributeError:
        return ArchList(filter(lambda d: "cwe" in d.keys(), rule.get('metadata'))).get(0, {}).get('cwe', "")
    except Exception:
        logger.warning(f"Could not get cwe for rule {rule.get('id', '')}")
        return ""

def get_lang(rule: Dict[str, Any]) -> str:
    return ArchList(rule.get('languages', [])).get(0, "")

def get_framework(path: str, rule: Dict[str, Any]) -> str:
    # get the dir name immediately under the language
    lang = get_lang(rule)
    s = path.split(os.path.sep)
    logger.debug(f"Split path={s}")
    if 'contrib' in path:
        return s[s.index('contrib')+1]
    return s[s.index(lang)+1]

def is_security(path: str) -> bool:
    return "security" in path

def is_rule(path: str) -> bool:
    _, ext = os.path.splitext(path)
    return "yaml" in ext

def normalize_owasp(owasp: str) -> str:
    return owasp.replace(" -", ":").replace("\'", "")

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    # Add arguments here
    parser.add_argument("directory")

    args = parser.parse_args()

    owasp_matrix = defaultdict(list)
    cwe_matrix = defaultdict(list)
    owasp_by_lang_matrix = defaultdict(lambda: defaultdict(list))
    cwe_by_lang_matrix = defaultdict(lambda: defaultdict(list))
    owasp_by_framework_matrix = defaultdict(lambda: defaultdict(lambda: defaultdict(list)))
    cwe_by_framework_matrix = defaultdict(lambda: defaultdict(lambda: defaultdict(list)))
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
                    framework = get_framework(path, rule)
                    lang = get_lang(rule)
                    cwe = get_cwe(rule)
                    owasp = normalize_owasp(get_owasp(rule))
                    owasp_matrix[owasp].append((path, rule))
                    cwe_matrix[cwe].append((path, rule))
                    owasp_by_lang_matrix[owasp][lang].append((path, rule))
                    cwe_by_lang_matrix[cwe][lang].append((path, rule))
                    owasp_by_framework_matrix[owasp][lang][framework].append((path, rule))
                    cwe_by_framework_matrix[cwe][lang][framework].append((path, rule))

    print(json.dumps({
        "owasp": {
            "totals": {owasp: len(v) for owasp, v in sorted(owasp_matrix.items())},
            "per_framework": {owasp: {lang: {frm: len(v) for frm, v in owasp_by_framework_matrix[owasp][lang].items()} for lang in sorted(owasp_by_framework_matrix[owasp])} for owasp in sorted(owasp_by_framework_matrix)},
            "rules_with_no_owasp": [t[0] for t in owasp_matrix[""]],
        },
        "cwe": {
            "totals": {cwe: len(v) for k, v in sorted(cwe_matrix.items())},
            "per_framework": {cwe: {lang: {frm: len(v) for frm, v in cwe_by_framework_matrix[cwe][lang].items()} for lang in sorted(cwe_by_framework_matrix[cwe])} for cwe in sorted(cwe_by_framework_matrix)},
            "rules_with_no_cwe": [t[0] for t in cwe_matrix[""]],
        }
    }))
