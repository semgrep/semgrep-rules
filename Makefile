test:
	semgrep --validate --config=$$PWD/python $$PWD
	semgrep --validate --config=$$PWD/c $$PWD
	semgrep --validate --config=$$PWD/javascript $$PWD
	semgrep --validate --config=$$PWD/java $$PWD
	semgrep --validate --config=$$PWD/go $$PWD
	semgrep --test --strict --test-ignore-todo --dangerously-allow-arbitrary-code-execution-from-rules $$PWD
