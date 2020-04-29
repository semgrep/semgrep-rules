test:
	semgrep --validate --config=./python .
	semgrep --validate --config=./c .
	semgrep --validate --config=./javascript .
	semgrep --validate --config=./java .
	semgrep --validate --config=./go .
	semgrep --test --strict --test-ignore-todo --dangerously-allow-arbitrary-code-execution-from-rules .
