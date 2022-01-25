#!/usr/bin/env python3

# Generates a markdown table showing coverage (in number of rules)
# that we have for each metacategory (XSS, CSRF) per language, per framework
# Takes in the json output from matrixify.py
# Run: python gen_table.py json_output.json --save cwe_coverage_table.md

import io
import json
import os
import sys
from collections import defaultdict

from typing import Dict, Any

def parse_json(data: Dict[str, Any]) -> str:
    print(data)

def save(stuff: bytes, filename: str):
    with open(filename, 'wb') as fout:
        fout.write(stuff)

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

    cwe_stats = parse_json(json_data)
    #table = create_table(cwe_stats)

    if args.save:
        save(table, args.save)
    else:
        print(table)
