#!/usr/bin/env python
from sys import argv
import subprocess

# ruleid: subprocess-list-passed-as-string
subprocess.run(" ".join(["snakemake", "-R", "`snakemake --list-params-changes`"] + argv[1:]), shell=True)

# ok: subprocess-list-passed-as-string
subprocess.run(["snakemake", "-R", "`snakemake --list-params-changes`"] + argv[1:], shell=True)
