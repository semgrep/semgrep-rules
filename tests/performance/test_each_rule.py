import logging
import os
import subprocess
import sys
from pathlib import Path
from typing import Generator

import pytest

from tests.util import is_rule, rule_paths


@pytest.mark.parametrize(
    "rule",
    rule_paths(),
    ids=lambda path: os.path.relpath(str(path), os.getcwd())
)
def test_semgrep_rules_rule(rule, benchmark):
    benchmark(
        subprocess.check_output,
        [
            "python3",
            "-m",
            "semgrep",
            "--jobs",
            "1",
            "--dangerously-allow-arbitrary-code-execution-from-rules",
            "--strict",
            "--test",
            "--test-ignore-todo",
            rule,
        ],
    )
