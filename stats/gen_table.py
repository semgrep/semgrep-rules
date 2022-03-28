#!/usr/bin/env python3

# Generates a markdown table showing coverage (in number of rules)
# that we have for each metacategory (XSS, CSRF) per language, per framework
# Takes in the json output from matrixify.py
# Run: python gen_table.py json_output.json --save cwe_coverage_table.md

import json
import os
import sys
import pprint
import yaml
import pandas as pd

from collections import defaultdict
from typing import Dict, Any

# Reads 'cwe_to_metacategory.yml' to construct a map to convert a CWE to a metacategory
def create_metacategory_map(path: str) -> Dict[str, str]:
    cwe_mc_map = {} # {cwe, metacategory}

    with open(path, 'r') as mc_map_file:
        mc_map = yaml.safe_load(mc_map_file)

        for mc in mc_map:
            for cwe in mc_map[mc]:
                cwe_mc_map[cwe] = mc

    return cwe_mc_map


def parse_cwe_mc_counts(data: Dict[str, Any]) -> Dict[str, Any]:
    mc_cwe_counts = defaultdict(lambda: defaultdict(lambda: defaultdict(int)))
    cwe_to_mc = create_metacategory_map('cwe_to_metacategory.yml')
    cwe_data = data.get('cwe').get('per_framework')
    for cwe in cwe_data:
        languages = cwe_data[cwe]
        mc = cwe_to_mc[cwe] if cwe in cwe_to_mc else "Unmapped Metacategory"
        for lang in languages:
            frameworks = languages[lang]
            for framework in frameworks:
                cwe_count = frameworks[framework]
                mc_cwe_counts[lang][framework][mc] = cwe_count
    return mc_cwe_counts


def save(stuff: bytes, filename: str):
    with open(filename, 'wb') as fout:
        fout.write(stuff)


# rows: framework, cols: metacategory
if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    # Add arguments here

    parser.add_argument("json_data")
    parser.add_argument("--save")

    args = parser.parse_args()

    input_file = args.json_data
    if os.path.exists(input_file):
        with open(input_file, 'r') as fin:
            json_data = json.load(fin)
    else:
        print("Error: No json input file specified")
        sys.exit(1)

    cwe_metacategory_stats = parse_cwe_mc_counts(json_data)
    dataframes = defaultdict(map)

    output = ''
    for language in cwe_metacategory_stats:
        df = pd.DataFrame(cwe_metacategory_stats[language])
        # table = create_table(cwe_metacategory_stats)
        dataframes[language] = df.fillna(0).to_markdown()
        output += f'## {language}\n\n'
        output += dataframes[language]
        output += '\n\n\n'

    if args.save:
        save(output.encode('UTF-8'), args.save)
    else:
        print(output)
