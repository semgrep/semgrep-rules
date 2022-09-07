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

.PHONY: validate
validate:
	for root in $(RULE_FOLDERS); do \
	  echo "======== validate rule files in $$root ========"; \
	  time -p $(SEMGREP) --validate \
	    --strict --disable-version-check \
	    --metrics=off --verbose \
	    --config="$$root"; \
	done 2>&1

.PHONY: test-only
test-only:
	for root in $(RULE_FOLDERS); do \
	  echo "========= test rules in $$root ========="; \
	  time -p $(SEMGREP) --test --test-ignore-todo \
	    --strict --disable-version-check \
	    --metrics=off --verbose \
	    "$$root"; \
	done 2>&1
