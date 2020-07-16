import logging
import os
import subprocess
import sys
from pathlib import Path
from typing import Generator

import pytest

logger = logging.getLogger(__file__)
logger.setLevel(logging.INFO)
handler = logging.StreamHandler(stream=sys.stderr)
handler.setFormatter(logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s'))
logger.addHandler(handler)

def is_rule(path: str) -> bool:
    _, ext = os.path.splitext(path)
    return "yaml" in ext or "yml" in ext

def rule_paths() -> Generator[Path, None, None]:
    for dirpath, _, filenames in os.walk(os.getcwd()):
        for filename in filenames:
            path = os.path.join(dirpath, filename)
            if is_rule(path) and os.path.basename(path) != "template.yaml" and (not os.path.basename(path).startswith(".")):
                yield Path(path)

@pytest.mark.parametrize(
    "rule",
    rule_paths(),
    ids=lambda path: str(path)
)
def test_semgrep_rules_rule(rule, benchmark):
    logger.info(f"Benchmark for '{rule}'")
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
