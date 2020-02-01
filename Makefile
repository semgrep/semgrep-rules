test:
	sgrep-lint --validate python .
    sgrep-lint --validate c .
    ./test.py --ignore-todo .
