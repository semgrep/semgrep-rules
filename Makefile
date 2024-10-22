#
# Check rule validity and check that semgrep finds the expected findings.
# See https://semgrep.dev/docs/writing-rules/testing-rules for more info.
#
# The semgrep repo (and now semgrep-pro repo) also runs those tests as part
# of its CI for consistency.
#
.PHONY: test
test:
	$(MAKE) validate
	$(MAKE) test-only

# Use the SEMGREP env variable to specify a non-standard semgrep command
SEMGREP ?= semgrep

.PHONY: test-only
#old: pysemgrep --test was also using flags below but not needed
# --test-ignore-todo --strict --disable-version-check --metrics=off --verbose
test-only:
	$(SEMGREP) test --pro .

# TODO: semgrep validate use a different targeting than 'semgrep test'
# so we unfortunately need this whitelist of dirs because it reports
# errors on stats/ and scripts/ (and .github/workflows/) files otherwise
# (we also skip libsonnet/ and trusted_python/ which do not contain rules)
LANG_DIRS=\
 bash \
 c \
 clojure \
 csharp \
 dockerfile \
 generic \
 go \
 html \
 java \
 javascript \
 json \
 kotlin \
 ocaml \
 php \
 python \
 ruby \
 rust \
 scala \
 solidity \
 swift \
 terraform \
 typescript \
 yaml
PRO_DIRS=apex elixir
OTHER_DIRS=ai problem-based-packs
DIRS=$(LANG_DIRS) $(PRO_DIRS) $(OTHER_DIRS)

.PHONY: validate
#old: pysemgrep --validate was also using the flags below but not needed
# --strict --disable-version-check --metrics=off --verbose
validate:
	$(SEMGREP) validate --pro $(DIRS)

.PHONY: test-oss-only
test-oss-only:
	@for dir in $(LANG_DIRS) $(OTHER_DIRS); do \
	   echo "processing $$dir"; \
           $(SEMGREP) test $$dir; \
        done
