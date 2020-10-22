import ast
import logging
import os
import signal
import subprocess
import sys
import tempfile
import yaml
from pathlib import Path
from collections import defaultdict
from textwrap import dedent
from typing import Generator, Tuple, Dict, Optional, List, Set

import pytest

import tests.util
from tests.util import rule_paths, ArchList

CONFIG_PATH = (Path(__file__).parent) / ".test_public_repos.yaml"

Language = str
RepoUrl = str
CommitHash = str
RepoTarget = Tuple[RepoUrl, Optional[CommitHash]]
Config = Dict[Language, RepoTarget]

def _read_config(config_path: Path) -> Config:
    with open(config_path, 'r') as fin:
        return yaml.safe_load(fin)

config = _read_config(CONFIG_PATH)

# Override config if --git-repo set.
# This is a little hacky since it'll add 'skip' tests
# for all other languages.
if tests.util.git_repo:
    for language in config.keys():
        config[language] = [{
            "url": tests.util.git_repo,
            "commit": None
        }]

language_to_rules: Dict[Language, List[Path]] = defaultdict(list)
for rule_path in rule_paths():
    language_to_rules[os.path.relpath(rule_path, os.getcwd()).split(os.path.sep)[0]].append(rule_path)

def generate_setup_repo_fixture(repo_target):
    @pytest.fixture(scope="module")
    def _setup_repo(tmp_path_factory):
        repo_url = repo_target.get('url')
        commit_hash = repo_target.get('commit')

        temp_dir = tmp_path_factory.mktemp("repos")

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

        return target_dir
    return _setup_repo

# cf. https://github.com/pytest-dev/pytest/issues/2424#issuecomment-333387206
def inject_fixture(name, repo_target):
    globals()[name] = generate_setup_repo_fixture(repo_target)

def get_language(rule_path: Path) -> Optional[str]:
    languages = config.keys()
    intersect = set(list(str(rule_path).split(os.path.sep))).intersection(set(languages))
    if len(intersect):
        return intersect.pop()
    return None

for language in config.keys():
    inject_fixture(f"setup_repo_{language}", config.get(language).pop()) # Only do one repo for now

all_rule_paths = list(rule_paths(tests.util.rule_directory)) # Consume generator to produce list
def filter_by_language(rule_paths, language):
    for rule_path in rule_paths:
        with open(rule_path, 'r') as fin:
            rules = yaml.safe_load(fin)
        languages = []
        for rule in rules.get('rules', []):
            languages.extend(rule.get('languages', []))
        if language in languages:
            yield rule_path

# This is pure black magic, and I hate it. T_T
# I'm doing this, in short, because I want to parametrize the test functions.
# However, pytest's native parametrization only lets me do the cross product
# of repo x rules.
# So here's why I'm doing this:
## 0) I really want to use pytest-benchmark.
## 1) I need different fixtures for each rule set. With the cross product I have to run every rule on every repo.
##      I also need the repo fixtures so that we don't waste setup and teardown time.
##      pytest does fixtures by introspecting function arguments. Since I'm doing dynamic fixtures,
##      I needed dynamic function argument names. This template lets me do that.
## 2) I need different rule sets for each langauge.
##      I really struggled to get parametrization or fixtures to work this way. All I really wanted was a way
##      to select a subset of the rules based on the setup repo fixture. However, that proved nigh impossible.
##      This is because parametrization happens when the test is collected. There exists an 'indirect' parameter
##      which defers things to runtime, but I needed the ability to decide based on the repo fixture, which
##      needed to be dynamic, which was the same problem as (1).
##      I also tried passing a "table" of records (a bunch of (language, repo, rule_path) tuples) but pytest
##      just exploded when trying to compose fixtures.
## 3) I want this to be configurable from the YAML file so that it's easy to add a new language.
# Seriously, this is my last resort after over a day of wrestling with pytest's behind-the-scenes magic. T_T
testing_template = """
@pytest.mark.parametrize(
    "rule_path",
    list(filter_by_language(all_rule_paths, "{language}")),
    ids=lambda path: os.path.relpath(str(path), os.getcwd())
)
def test_{language}_rules(setup_repo_{language}, rule_path, benchmark):
    benchmark(
        subprocess.run,
        [
            "python3",
            "-m",
            "semgrep",
            "--jobs",
            "1",
            "--dangerously-allow-arbitrary-code-execution-from-rules",
            "--config",
            rule_path,
            setup_repo_{language}
        ],
    )
"""

for language in config.keys():
    language = ''.join([c for c in language if c.isalpha()]) # Only include alphanum chars because I'm paranoid
    exec(testing_template.format(language=language))
