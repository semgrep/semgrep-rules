test:
	DIR=`pwd`
	echo $DIR
	semgrep --validate --config=$DIR/python .
	semgrep --validate --config=$DIR/c .
	semgrep --validate --config=$DIR/javascript .
	semgrep --validate --config=$DIR/java .
	semgrep --validate --config="$DIR/go" .
	semgrep --test --strict --test-ignore-todo --dangerously-allow-arbitrary-code-execution-from-rules .
