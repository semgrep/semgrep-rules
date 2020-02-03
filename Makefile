test:
	sgrep-lint --validate --config=./python .
	sgrep-lint --validate --config=./c .
	sgrep-lint --validate --config=./javascript .
	sgrep-lint --validate --config=./java .
	./test.py --ignore-todo .
