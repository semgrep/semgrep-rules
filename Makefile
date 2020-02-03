test:
	sgrep-lint --validate --config=. .
	./test.py --ignore-todo .
