#!/usr/bin/python3

# Generates json output (json_output.json) for matrixify_graph.py
# Run: python matrixify.py .

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

def get_owasp(rule: Dict[str, Any]) -> List[str]:
    try:
        output = rule.get("metadata", {}).get("owasp", "")
        if type(output) == str: # Ensure that we're returning lists
            if output == "":
                return ["Not OWASP Related"]
            return [output.strip()]
        output = [o.strip() for o in output]
        return output
    except AttributeError:
        return ArchList(filter(lambda d: "owasp" in d.keys(), rule.get("metadata"))).get(0, {}).get("owasp", "")
    except Exception:
        logger.warning(f"Could not get owasp for rule {rule.get('id', '')}")
        return [""]

def get_cwe(rule: Dict[str, Any]) -> List[str]:
    try:
        output = rule.get("metadata", {}).get("cwe", "")
        if type(output) == str:
            if output == "":
                return ["Uncategorized CWE"]
            return [output.strip()]
        output = [c.strip() for c in output]
        return output
    except AttributeError:
        return ArchList(filter(lambda d: "cwe" in d.keys(), rule.get("metadata"))).get(0, {}).get("cwe", "")
    except Exception:
        logger.warning(f"Could not get cwe for rule {rule.get('id', '')}")
        return ['']

def get_technology(rule: Dict[str, Any]) -> List[str]:
    try:
        output = rule.get("metadata", {}).get("technology", "")
        if type(output) == str: # Ensure that we're returning lists
            if output == "":
                return ["Uncategorized Technology"]
            return [output.strip()]
        output = [t.strip() for t in output]
        return output
    except AttributeError:
        return ArchList(filter(lambda d: "technology" in d.keys(), rule.get("metadata"))).get(0, {}).get("technology", "")
    except Exception:
        logger.warning(f"Could not get technology for rule {rule.get('id', '')}")
        return [""]

# Sometimes, the language as defined within the ArchList will be something that's not in the dict
# So, the filepath seems like the only reliable way to get the lanaguage
def get_lang(path: str) -> str:
    return path.split(os.path.sep)[1].strip()
    #archlist =  ArchList(rule.get('languages', [])).get(0, "")
    #return archlist

def get_framework(path: str) -> str:
    #  get the dir name immediately under the language
    s = path.split(os.path.sep)
    lang = s[1]
    if "contrib" in path:
        return s[s.index("contrib")+1].strip()
    # Crashes if lang is 'hcl'. This occurs with azure, aws, and lang
    # if lang == hcl:
    return s[s.index(lang)+1].strip()

# Reads 'cwe_to_metacategory.yml' to construct a map to convert a CWE to a metacategory
def create_metacategory_map(path: str) -> Dict[str, str]:
    with open(path, "r") as mc_map_file:
        mc_map = yaml.safe_load(mc_map_file)

    # list comprehensions are complicated!
    # in this case, first we need to enumerate the keys, then we need to enumerate *all* entries for that key
    return {cwe: mc for mc in mc_map.keys() for cwe in mc_map[mc]}

def is_security(path: str) -> bool:
    return "security" in path

def is_rule(path: str) -> bool:
    _, ext = os.path.splitext(path)
    return ext in (".yaml", ".yml") and "/scripts/" not in path

def is_audit(path: str) -> bool:
    return "/audit/" in path or path.endswith("/audit")

def is_taint(rule: Dict[str, Any]) -> bool:
    if 'mode' in rule:
        if rule['mode'] == 'taint':
            return True
    return False

def is_high_confidence(rule: Dict[str, Any]) -> bool:
    if 'metadata' in rule:
        metadata = rule['metadata']
        if 'confidence' in metadata:
            confidence = metadata['confidence']

            if confidence.lower().strip() == 'high':
                return True
    return False

# Fixes rules that have wacky owasp tags, like not having both the name and number, having misspellings, being mislabelled, etc
def normalize_owasp(owasp: str) -> str:
    if "A01:2017" in owasp or "A03:2021" in owasp:
        return "A1: Injection"
    if "A01:2021" in owasp:
        return "A5: Broken Access Control"
    if "A02:2017" in owasp:
        return "A2: Broken Authentication"
    if "A03:2017" in owasp or "A02:2021" in owasp: # Maps "Cryptographic Failures" to "Sensitive Data Exposure"
        return "A3: Sensitive Data Exposure"
    if "A05:2021" in owasp or "A06:2017" in owasp:
        return "A6: Security Misconfiguration"
    if "A05:2017" in owasp:
        return "A5: Broken Access Control"
    if "A07:2017" in owasp:
        return "A7: Cross-Site Scripting (XSS)"
    if "A10:2021" in owasp:
        return "A10:2021 - Server-Side Request Forgery (SSRF)"
    return owasp

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    # Add arguments here
    parser.add_argument("--skip-audit", "-s", help="skip audit rules", action='store_true')
    parser.add_argument("--taint-only", "-t", help="only process taint mode rules. does not exclude audit rules using taint mode. use in combination with `--taint-only` to do so.", action='store_true')
    parser.add_argument("--high-signal", "-hs", help="process all taint mode rules in addition to ones with `confidence: HIGH`, even if they don't use taint. excludes all audit rules. NOTE: do NOT mix with `--skip-audit` or `--taint-only`", action='store_true')
    parser.add_argument("--output-file", "-o", help="file to output json to")
    parser.add_argument("directory", help="directory to scan")

    args = parser.parse_args()

    metacategories = create_metacategory_map("cwe_to_metacategory.yml")

    owasp_matrix = defaultdict(list)
    cwe_matrix = defaultdict(list)
    owasp_by_lang_matrix = defaultdict(lambda: defaultdict(list))
    cwe_by_lang_matrix = defaultdict(lambda: defaultdict(list))
    owasp_by_framework_matrix = defaultdict(lambda: defaultdict(lambda: defaultdict(list)))
    cwe_by_framework_matrix = defaultdict(lambda: defaultdict(lambda: defaultdict(list)))
    owasp_by_technology_matrix = defaultdict(lambda: defaultdict(lambda: defaultdict(list)))
    cwe_by_technology_matrix = defaultdict(lambda: defaultdict(lambda: defaultdict(list)))
    cwe_metacategory_matrix = defaultdict(lambda: defaultdict(lambda: defaultdict(lambda: set())))

    for dirpath, dirnames, filenames in os.walk(args.directory):
        if args.skip_audit and is_audit(dirpath):
            continue
        for filename in filenames:
            path = os.path.join(dirpath, filename)
            if not is_rule(path) or not is_security(path):
                continue
            with open(path, "r") as fin:
                rules = yaml.safe_load(fin)
                for rule in rules.get("rules", []):
                    if args.taint_only:
                        if not is_taint(rule):
                            continue

                    # Include rules in high signal scanning if a rule has `confidence: HIGH` OR (is a taint mode rule AND not an audit rule)
                    if args.high_signal:
                        if is_high_confidence(rule) or (is_taint(rule) and not is_audit(path)):
                            pass # go on to process the rule
                        else:
                            continue # skip to the next rule

                    cwe = get_cwe(rule)
                    lang = get_lang(path)
                    owasp = get_owasp(rule)
                    framework = get_framework(path)
                    technology = get_technology(rule)

                    for c in cwe:
                        cwe_matrix[c].append((path, rule))
                        cwe_by_lang_matrix[c][lang].append((path, rule))
                        cwe_by_framework_matrix[c][lang][framework].append((path, rule))
                        for tech in technology:
                            cwe_by_technology_matrix[c][lang][tech].append((path, rule))

                        if c in metacategories:
                            metacategory = metacategories[c]
                            cwe_metacategory_matrix[lang][framework][metacategory].add(c)

                    for owasp_standard in owasp: # Some rules have multiple owasp tags
                        owasp_standard = normalize_owasp(owasp_standard)
                        owasp_matrix[owasp_standard].append((path, rule))
                        owasp_by_lang_matrix[owasp_standard][lang].append((path, rule))
                        owasp_by_framework_matrix[owasp_standard][lang][framework].append((path, rule))
                        for tech in technology: # Some rules have multiple technology tags
                            owasp_by_technology_matrix[owasp_standard][lang][tech].append((path, rule))

    out_file_name = args.output_file if args.output_file else 'json_output.json'
    of = open(out_file_name, "w")
    of.write(json.dumps({
        "owasp": {
            "totals": {owasp: len(v) for owasp, v in sorted(owasp_matrix.items())},
            "per_framework": {owasp: {lang: {frm: len(v) for frm, v in owasp_by_framework_matrix[owasp][lang].items()} for lang in sorted(owasp_by_framework_matrix[owasp])} for owasp in sorted(owasp_by_framework_matrix)},
            "per_technology": {owasp: {lang: {frm: len(v) for frm, v in owasp_by_technology_matrix[owasp][lang].items()} for lang in sorted(owasp_by_technology_matrix[owasp])} for owasp in sorted(owasp_by_technology_matrix)},
            "rules_with_no_owasp": [t[0] for t in owasp_matrix[""]],
        },
        "cwe": {
            "totals": {cwe: len(v) for cwe, v in sorted(cwe_matrix.items())},
            "per_framework": {cwe: {lang: {frm: len(v) for frm, v in cwe_by_framework_matrix[cwe][lang].items()} for lang in sorted(cwe_by_framework_matrix[cwe])} for cwe in sorted(cwe_by_framework_matrix)},
            "per_technology": {cwe: {lang: {frm: len(v) for frm, v in cwe_by_technology_matrix[cwe][lang].items()} for lang in sorted(cwe_by_technology_matrix[cwe])} for cwe in sorted(cwe_by_technology_matrix)},
            "per_metacategory": { # formatting this one specifically because it's especially awful to read as a one-liner
                lang: {
                    frm: {
                        mc: {
                            c: (
                                {"count": len(cwe_metacategory_matrix[lang][frm][mc])},
                                {"cwes": [cwe for cwe in cwe_metacategory_matrix[lang][frm][mc]]},
                            )
                        } for mc in cwe_metacategory_matrix[lang][frm]
                    } for frm in sorted(cwe_metacategory_matrix[lang])
                } for lang in sorted(cwe_metacategory_matrix)
            },
            "rules_with_no_cwe": [t[0] for t in cwe_matrix[""]],
        }
    }))

