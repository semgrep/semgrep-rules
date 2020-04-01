#!/usr/bin/env python3

import argparse
import os
import sys
from jinja2 import Environment, FileSystemLoader


def main():
    parser = argparse.ArgumentParser("CLI for injection templates")
    parser.add_argument("--id", type=str, help="Check ID")
    parser.add_argument("--message", type=str, help="Check message")
    parser.add_argument("--sink", type=str, help="Sink")

    options = parser.parse_args(sys.argv[1:])

    env = Environment(
        loader=FileSystemLoader(os.path.join(os.getcwd(), "templates/"))
    )
    injection_template = env.get_template("injection-template.yaml.j2")
    print(injection_template.render(
        id=options.id,
        message=options.message,
        sink=options.sink,
    ))


if __name__ == "__main__":
    main()
