# sgrep-rules

[![r2c community slack](https://img.shields.io/badge/r2c_slack-join-brightgreen?style=for-the-badge&logo=slack&labelColor=4A154B)](https://join.slack.com/t/r2c-community/shared_invite/enQtNjU0NDYzMjAwODY4LWE3NTg1MGNhYTAwMzk5ZGRhMjQ2MzVhNGJiZjI1ZWQ0NjQ2YWI4ZGY3OGViMGJjNzA4ODQ3MjEzOWExNjZlNTA)

This is an repository containing rules written for [sgrep](https://sgrep.dev), organized by language. Go to the main sgrep documentation for details on sgrep and the syntax for the yaml files in this repository.

## Contributing

| sgrep | test status          |
| ------- | ------------------ |
| `latest`   | [![sgrep-rules-test](https://github.com/returntocorp/sgrep-rules/workflows/sgrep/badge.svg?branch=master)](https://github.com/returntocorp/sgrep-rules/actions?query=workflow%3Asgrep) |
| `develop`  | [![sgrep-rules-test-develop](https://github.com/returntocorp/sgrep-rules/workflows/sgrep-develop/badge.svg)](https://github.com/returntocorp/sgrep-rules/actions?query=workflow%3Asgrep-develop) |

We welcome contributions to this repo! Please fork and make a pull request; we'll contact you about signing our CLA.

## Running Rules in CI/Pre-Commit/Developer Workflow

If you want run these rules rather than write them, check out the easy-to-use [bento.dev](https://bento.dev)

## Help

Contact the team at [sgrep@r2c.dev](mailto:sgrep@r2c.dev) for help.

## Testing Rules

A testing system is available which can be used to check the rules against example source code files.

If you wrote a rule in a yaml named `eqeq-bad.yaml` with a rule id named `my-eqeq-bad`, you could put a file in the same directory named eqeq-bad.py (it just needs to have the same name except for the extension as eqeq-bad.yaml). Then:

```python
# ruleid:my-eqeq-bad
x == x
```

Running `make test` will execute the test suite, and if `my-eqeq-bad` does not fire on the line below the comment, your rule will fail.

If you have a rule that is not working, but you want to commit it soo it's documented but not fail the tests, use `#todoruleid:...`:

```python
# todoruleid:my-eqeq-bad
x != x
```

### Github Action To Run Tests

If you fork this repo or create your own, you can add a special [sgrep-rules-test](https://github.com/marketplace/actions/sgrep-rules-test) Github Action to your workflow that will automatically test your rules by running `make test` using the latest version of sgrep.

See ours [here](.github/workflows/sgrep-rules-test.yml)
