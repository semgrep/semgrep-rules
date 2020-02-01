test:
	sgrep-lint --validate --config=./python .
	sgrep-lint --validate --config=./c .
	./test.py --ignore-todo .
