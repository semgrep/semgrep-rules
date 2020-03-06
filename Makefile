test:
	sgrep-lint --validate --config=./python .
	sgrep-lint --validate --config=./c .
	sgrep-lint --validate --config=./javascript .
	sgrep-lint --validate --config=./java .
	sgrep-lint --validate --config=./go .
	sgrep-lint --test --strict --test-ignore-todo --dangerously-allow-arbitrary-code-execution-from-rules .
