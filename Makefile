test:
	semgrep --validate --config=$$PWD/python $$PWD
	semgrep --validate --config=$$PWD/c $$PWD
	semgrep --validate --config=$$PWD/javascript $$PWD
	semgrep --validate --config=$$PWD/java $$PWD
	semgrep --validate --config=$$PWD/go $$PWD
	semgrep --validate --config=$$PWD/ocaml $$PWD
	semgrep --test --strict --test-ignore-todo --quiet $$PWD

output:
	semgrep --test --strict --test-ignore-todo --quiet --save-test-output-tar $$PWD
