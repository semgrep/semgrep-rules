#!/usr/bin/env python3

# Generates graphs showing our owasp coverage per language and technology
# based on the json output from matrixify.py 
# Run: python matrixify_graph.py json_output.json --save graph.png
# which will output owasp_graph.png and tech_graph.png

import base64
import io
import json
import os
import sys
import requests
import pandas as pd
import matplotlib.pyplot as plt
from collections import defaultdict

from typing import Dict, Any

plt.style.use("ggplot")

def generate_owasp_coverage_by_language_plot(df: pd.DataFrame) -> io.BytesIO:
    stream = io.BytesIO()
    ax = df.unstack().plot.bar(
        figsize=(20,7),
        rot=0,
        title="OWASP Coverage by Language"
    )
    fig = ax.get_figure()
    fig.savefig(stream, format="png")
    stream.seek(0)
    return stream

def generate_owasp_coverage_by_language_graph(data: Dict[str, Any]) -> bytes:
    pf = data.get('owasp').get('per_framework')
    owasp_table = []
    for owasp in pf:
        for lang in pf[owasp]:
            for frmwk in pf[owasp][lang]:
                owasp_table.append((
                    owasp,
                    lang,
                    frmwk,
                    pf[owasp][lang][frmwk]
                ))
    owaspdf = pd.DataFrame(owasp_table, columns=["OWASP", "Language", "Framework", "Rules"])
    bylang = owaspdf.groupby(["Language", "OWASP"]).sum()
    return generate_owasp_coverage_by_language_plot(bylang)

def generate_owasp_coverage_by_technology_plot(df: pd.DataFrame) -> io.BytesIO:
    stream = io.BytesIO()
    ax = df.unstack().plot.bar(
        figsize=(50,7),
        rot=0,
        title="OWASP Coverage by Technology"
    )
    fig = ax.get_figure()
    fig.savefig(stream, format="png")
    stream.seek(0)
    return stream

def generate_owasp_coverage_by_technology_graph(data: Dict[str, Any]) -> bytes:
    pf = data.get('owasp').get('per_technology')
    owasp_table = []
    tech_to_langs = defaultdict(set) # A map to keep track of what languages each technology belongs to
    num_rules_per_tech = defaultdict(lambda: defaultdict(int)) # Keeps track of the number of rules per technology. For filtering ones with a low number of rules
    for owasp in pf:
        for lang in pf[owasp]:
            for tech in pf[owasp][lang]:
                num_rules = pf[owasp][lang][tech]
                owasp_table.append((
                    owasp,
                    tech,
                    num_rules
                ))
                tech_to_langs[tech].add(lang)
                num_rules_per_tech[tech][owasp] += num_rules

    # Yucky code for filtering out technologies with a small number of rules
    # otherwise the generated graph is cluttered and unreadable
    owasp_table_filtered = []
    for tech in num_rules_per_tech:
        owasps = num_rules_per_tech[tech] # Returns a map of owasp_name -> number of rules with owasp_name in this technology
        total_per_tech = 0 # Keep track of how many rules there are for a given technology
        for owasp in owasps:
            total_per_tech += owasps[owasp]
        if total_per_tech > 10:
            for owasp in owasps:
                for lang in tech_to_langs[tech]: # tech_to_langs[tech] gives the languages for the current technology
                    langs_for_owasp = pf[owasp] # pf[owasp] gives the languages for a given owasp standard, mapped to its technologies
                    if lang in langs_for_owasp:
                        technologies_for_lang = langs_for_owasp[lang]
                        if tech in technologies_for_lang:
                            owasp_table_filtered.append((
                                owasp,
                                tech,
                                technologies_for_lang[tech]
                            ))

    owaspdf = pd.DataFrame(owasp_table_filtered, columns=["OWASP", "Technology", "Rules"])
    bylang = owaspdf.groupby(["Technology", "OWASP"]).sum()
    return generate_owasp_coverage_by_technology_plot(bylang)

def img_tag(data: bytes) -> str:
    data = base64.b64encode(data)
    return '<img src="data:image/png;base64, {}">'.format(data.decode('utf-8'))

def save(stuff: bytes, filename: str):
    with open(filename, 'wb') as fout:
        fout.write(stuff)

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    # Add arguments here

    parser.add_argument("uri")
    parser.add_argument("--save")
    parser.add_argument("--img-tag", action="store_true")

    args = parser.parse_args()

    uri = args.uri
    if os.path.exists(uri):
        with open(uri, 'r') as fin:
            data = json.load(fin)
    else:
        r = requests.get(uri)
        data = r.json()

    owasp_dump = generate_owasp_coverage_by_language_graph(data).read()
    tech_dump = generate_owasp_coverage_by_technology_graph(data).read()

    if args.img_tag:
        owasp_dump = img_tag(owasp_dump)
        tech_dump = img_tag(tech_dump)

    if args.save:
        save(owasp_dump, 'lang_' + args.save)
        save(tech_dump, 'tech_' + args.save)
    else:
        print(owasp_dump)
        print(tech_dump)
