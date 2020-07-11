test:
	semgrep --validate --config=$PWD/python .
	semgrep --validate --config=$PWD/c .
	semgrep --validate --config=$PWD/javascript .
	semgrep --validate --config=$PWD/java .
	semgrep --validate --config=$PWD/go" .
	semgrep --test --strict --test-ignore-todo --dangerously-allow-arbitrary-code-execution-from-rules .
