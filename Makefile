#
# Check rule validity and check that semgrep finds the expected findings.
#
# The semgrep repo also runs this as part of its CI for consistency.
#
.PHONY: test
test:
	$(MAKE) validate
	$(MAKE) test-only

# Use the SEMGREP environment variable to specify a non-standard semgrep
# command. This is useful for calling a development version of semgrep
# e.g.
#   PIPENV_PIPFILE=~/semgrep/cli/Pipfile SEMGREP='pipenv run semgrep' make test
SEMGREP ?= semgrep

# TODO: semgrep validate use a different targeting than semgrep test
# so we unfortunately need this whitelist of dirs because it reports
# errors on stats/ and scripts/ (and .github yaml) files otherwise
# NOTE: the apex/ and elixir/ requires --pro (hence the --pro below)
# alt: we could also skip libsonnet/ and trusted_python/
DIRS=\
 ai \
 apex \
 bash \
 c \
 clojure \
 csharp \
 dockerfile \
 elixir \
 generic \
 go \
 html \
 java \
 javascript \
 json \
 kotlin \
 libsonnet \
 ocaml \
 php \
 problem-based-packs \
 python \
 ruby \
 rust \
 scala \
 solidity \
 swift \
 terraform \
 trusted_python \
 typescript \
 yaml

.PHONY: validate
#old: pysemgrep --validate was also using the flags below but not needed
# --strict --disable-version-check --metrics=off --verbose
validate:
	$(SEMGREP) validate --pro $(DIRS)

.PHONY: test-only
#old: pysemgrep --test was also using
# --test-ignore-todo --strict --disable-version-check --metrics=off --verbose
test-only:
	$(SEMGREP) test --pro .
