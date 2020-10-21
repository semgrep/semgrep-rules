import base64
import io
import json
import os
import sys
import requests
import pandas as pd
import matplotlib.pyplot as plt

from typing import Dict, Any

plt.style.use("ggplot")

def generate_owasp_coverage_by_language_plot(df: pd.DataFrame) -> io.BytesIO:
    stream = io.BytesIO()
    ax = df.unstack().plot.bar(
        figsize=(10,7),
        rot=0,
        title="OWASP Coverage by Language"
    )
    fig = ax.get_figure()
    fig.savefig(stream, format="png")
    stream.seek(0)
    return stream

def generate_owasp_coverage_by_language_graph(data: Dict[str, Any]) ->  bytes:
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
    owaspdf = pd.DataFrame(owasp_table, columns=["OWASP", "Language", "Framework", "Number of Rules"])
    bylang = owaspdf.groupby(["Language", "OWASP"]).sum()
    return generate_owasp_coverage_by_language_plot(bylang)

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

    dump = generate_owasp_coverage_by_language_graph(data).read()

    if args.img_tag:
        dump = img_tag(dump)

    if args.save:
        save(dump, args.save)
    else:
        print(dump)
