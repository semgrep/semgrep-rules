import logging
import os
import subprocess
import sys
import tempfile
import yaml
from pathlib import Path
from collections import defaultdict
from typing import Generator, Tuple, Dict, Optional, List

import pytest

from tests.util import rule_paths, ArchList

Language = str
RepoUrl = str
CommitHash = str
RepoTarget = Tuple[RepoUrl, Optional[CommitHash]]
Config = Dict[Language, RepoTarget]

CONFIG_PATH = (Path(__file__).parent) / "test_public_repos.yaml"
TEST_CONFIG_PATH = (Path(__file__).parent) / "test_test.yaml"

language_to_rules: Dict[Language, Path] = defaultdict(list)
for rule_path in rule_paths():
    language_to_rules[os.path.relpath(rule_path, os.getcwd()).split(os.path.sep)[0]].append(rule_path)

def read_config(config_path: Path) -> Config:
    with open(config_path, 'r') as fin:
        return yaml.safe_load(fin)

config = read_config(TEST_CONFIG_PATH)

def repo_params(config: Config) -> List[Tuple[Language, RepoTarget]]:
    targets = []
    for language in config:
        target = ArchList(config[language])
        targets.append(
            (target.get(0), target.get(1))
        )
    return targets
    
@pytest.fixture(scope="module", params=repo_params(config))
def setup_repo(tmp_path_factory, request) -> Path:
    temp_dir = tmp_path_factory.mktemp("repos")
    target: RepoTarget = request.param
    repo_url = target[0]
    commit_hash = target[1]

    name = repo_url.split('/')[-1]
    target_dir = os.path.join(temp_dir, name)
    subprocess.run(
        ["git", "clone", repo_url, target_dir]
    )
    if commit_hash:
        subprocess.run(
            ["git", "checkout", commit_hash],
            cwd=target_dir
        )
    subprocess.run(
        ["git", "clean", "-xdf"],
        cwd=target_dir
    )

    yield target_dir

@pytest.mark.parametrize(
    "rule_path",
    rule_paths(),
    ids=lambda path: os.path.relpath(str(path), os.getcwd())
)
def test_benchmark_on_repository(
    setup_repo, rule_path, benchmark
):
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
            "--config",
            rule_path,
            setup_repo 
        ],
    )        