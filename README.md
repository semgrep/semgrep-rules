# semgrep-rules

[![powered by semgrep](https://img.shields.io/badge/powered%20by-semgrep-1B2F3D?labelColor=lightgrey&link=https://semgrep.live/&style=flat-square&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAAA0AAAAOCAYAAAD0f5bSAAAABmJLR0QA/gD+AP+cH+QUAAAACXBIWXMAAA3XAAAN1wFCKJt4AAAAB3RJTUUH5AYMEy0l8dkqrQAAAvFJREFUKBUB5gIZ/QEAAP8BAAAAAAMG6AD9+hn/GzA//wD//wAAAAD+AAAAAgABAQDl0MEBAwbmAf36GQAAAAAAAQEC9QH//gv/Gi1GFQEC+OoAAAAAAAAAAAABAQAA//8AAAAAAAAAAAD//ggX5tO66gID9AEBFSRxAgYLzRQAAADpAAAAAP7+/gDl0cMPAAAA+wAAAPkbLz39AgICAAAAAAAAAAAs+vU12AEbLz4bAAAA5P8AAAAA//4A5NDDEwEBAO///wABAQEAAP//ABwcMD7hAQEBAAAAAAAAAAAaAgAAAOAAAAAAAQEBAOXRwxUAAADw//8AAgAAAAD//wAAAAAA5OXRwhcAAQEAAAAAAAAAAOICAAAABP3+/gDjzsAT//8A7gAAAAEAAAD+AAAA/wAAAAAAAAAA//8A7ePOwA/+/v4AAAAABAIAAAAAAAAAAAAAAO8AAAABAAAAAAAAAAIAAAABAAAAAAAAAAgAAAD/AAAA8wAAAAAAAAAAAgAAAAAAAAAAAAAAAAAAAA8AAAAEAAAA/gAAAP8AAAADAAAA/gAAAP8AAAAAAAAAAAAAAAACAAAAAAAAAAAAAAAAAAAA7wAAAPsAAAARAAAABAAAAP4AAAAAAAAAAgAAABYAAAAAAAAAAAIAAAD8AwICAB0yQP78/v4GAAAA/wAAAPAAAAD9AAAA/wAAAPr9//8aHTJA6AICAgAAAAD8AgAAADIAAAAAAP//AB4wPvgAAAARAQEA/gEBAP4BAQABAAAAGB0vPeIA//8AAAAAAAAAABAC+vUz1QAAAA8AAAAAAwMDABwwPu3//wAe//8AAv//ABAcMD7lAwMDAAAAAAAAAAAG+vU0+QEBAvUB//4L/xotRhUBAvjqAAAAAAAAAAAAAQEAAP//AAAAAAAAAAAA//4IF+bTuuoCA/QBAQAA/wEAAAAAAwboAP36Gf8bMD//AP//AAAAAP4AAAACAAEBAOXQwQEDBuYB/foZAAAAAAD4I6qbK3+1zQAAAABJRU5ErkJggg==)](https://semgrep.live/)
[![r2c community slack](https://img.shields.io/badge/slack-join-green?style=flat-square)](https://r2c.dev/slack)

| branch | using semgrep docker image | test status          |
| ------------ | ------------------------ | -------------------- |
| `master` | `returntocorp/semgrep:latest`   | [![semgrep-rules-test](https://github.com/returntocorp/semgrep-rules/workflows/semgrep/badge.svg?branch=master)](https://github.com/returntocorp/semgrep-rules/actions?query=workflow%3Asemgrep+branch%3Amaster) |
| `develop` | `returntocorp/semgrep:develop`  | [![semgrep-rules-test-develop](https://github.com/returntocorp/semgrep-rules/workflows/semgrep-develop/badge.svg)](https://github.com/returntocorp/semgrep-rules/actions?query=workflow%3Asemgrep-develop+branch%3Adevelop) |


This is an repository containing rules written for [semgrep](https://semgrep.dev), organized by language. Go to the [main semgrep documentation for details on semgrep](https://semgrep.live) and the syntax for the yaml files in this repository. You can also [browse these rules online](https://semgrep.live/registry).

## Security Coverage

`semgrep` features security rules that target [common weaknesses](https://cwe.mitre.org/) and [OWASP categories](https://owasp.org/www-project-top-ten/). Each `security` rule in this repository has metadata fields for `cwe` (and `owasp` when applicable). OWASP coverage for rules in this repository, organized by language, is shown below.

<p align="center">
    <img src="https://web-assets.r2c.dev/semgrep-rules-owasp-coverage-20200520.png" width="500" />
</p>

## Contributing

We welcome contributions to this repo! Please fork and make a pull request; we'll contact you about signing our CLA.

### Rule Namespacing

The namespacing format for contributing rules is `<language>.<framework>.<category>.$MORE`. If a `framework` isn't applicable, use `lang` instead.

`category` is one of:
- security
- correctness
- best-practice
- maintainability
- performance

If a `security` rule is discouraging the use of a bad pattern (such as formatted SQL strings), it is recommended to append `audit` to your namespace. This distinguishes it from a `security` rule that is specifically aiming to detect a vulnerability.

<p align="center">
    <img src="https://web-assets.r2c.dev/semgrep-live-namespacing.png" alt="semgrep.live rule namespace" width="500" />
</p>

## Running Rules in CI/Pre-Commit/Developer Workflow

If you want run these rules rather than write them, check out the easy-to-use [bento.dev](https://bento.dev)

## Help

Join slack for the fastest answers to your questions! Or contact the team at [semgrep@r2c.dev](mailto:semgrep@r2c.dev).

## Testing Rules

A testing system is available which can be used to check the rules against example source code files. It requires `semgrep` from [semgrep](https://semgrep.dev)

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

If you fork this repo or create your own, you can add a special [semgrep-rules-test](https://github.com/marketplace/actions/semgrep-rules-test) Github Action to your workflow that will automatically test your rules by running `make test` using the latest version of semgrep.

See ours [here](.github/workflows/semgrep-rules-test.yml)

