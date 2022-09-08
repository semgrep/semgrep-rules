# List of folders containing Semgrep rule files (with a .yml suffix).
#
# This is meant to exclude folders that don't contain rule files and
# may contain .yml files that are not Semgrep rules and would result
# in errors.
#
RULE_FOLDERS = $(shell ls -d */ | grep -v '^stats')

# This is for running using a dev version of semgrep such as:
#
#    PIPENV_PIPFILE=~/semgrep/cli/Pipfile SEMGREP='pipenv run semgrep' make
#
SEMGREP ?= semgrep

#
# Check rule validity and check that semgrep finds the expected findings.
#
# The semgrep repo also runs this as part of its CI.
#
.PHONY: test
test:
	$(MAKE) validate
	$(MAKE) test-only

# stdout is redirected to stderr so as to see the whole output in the correct
# order when running this from pytest.
# (pytest captures stdout and stderr separately and prints them later,
# if at all).
#
.PHONY: validate
validate:
	set -eu; \
	for root in $(RULE_FOLDERS); do \
	  echo "======== validate rule files in $$root ========"; \
	  time -p $(SEMGREP) --validate \
	    --strict --disable-version-check \
	    --metrics=off --verbose \
	    --config="./$$root"; \
	done >&2

.PHONY: test-only
test-only:
	set -eu; \
	for root in $(RULE_FOLDERS); do \
	  echo "========= test rules in $$root ========="; \
	  time -p $(SEMGREP) --test --test-ignore-todo \
	    --strict --disable-version-check \
	    --metrics=off --verbose \
	    "./$$root"; \
	done >&2
