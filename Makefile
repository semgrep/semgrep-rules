#
# Check rule validity and check that semgrep finds the expected findings.
#
# The semgrep repo also runs this as part of its CI for consistency.
#
.PHONY: test
test:
	$(MAKE) validate
	$(MAKE) test-only

.PHONY: validate
validate:
	./scripts/run-tests validate

.PHONY: test-only
test-only:
	./scripts/run-tests test
