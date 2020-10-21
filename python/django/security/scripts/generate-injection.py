#!/usr/bin/env python3

import logging
import os
import subprocess
import sys

from jinja2 import Template

logger = logging.getLogger(__file__)
logger.setLevel(logging.INFO)
handler = logging.StreamHandler(stream=sys.stderr)
handler.setFormatter(
    logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s")
)
logger.addHandler(handler)

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument("template_file", type=str, help="The template file to use.")
    parser.add_argument("--id", type=str, help="Check ID")
    parser.add_argument("--message", type=str, help="Check message")
    parser.add_argument("--sink", type=str, help="Sink")

    args = parser.parse_args()

    request_data_patterns = (
        "request.$W.get(...)",
        "request.$W(...)",
        "request.$W[...]",
        "request.$W"
    )
    format_patterns = (
        "$DATA",
        "$STR.format(..., $DATA, ...)",
        "$STR % $DATA",
        "f\"...{$DATA}...\"",
        "$STR + $DATA",
    )
    left_patterns = (
        "",
        "$A = ",
        "return "
    )

    context = {
        "sink": args.sink,
        "check_id": args.id,
        "message": args.message,
        "request_data_patterns": request_data_patterns,
        "format_patterns": format_patterns,
        "left_patterns": left_patterns,
    }

    with open(args.template_file, "r") as fin:
        template_file_contents = fin.read()
    t = Template(template_file_contents)
    print(t.render(context)+"\n")
