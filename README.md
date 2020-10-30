# semgrep-rules

[![powered by semgrep](https://img.shields.io/badge/powered%20by-semgrep-1B2F3D?labelColor=lightgrey&link=https://semgrep.live/&style=flat-square&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAAA0AAAAOCAYAAAD0f5bSAAAABmJLR0QA/gD+AP+cH+QUAAAACXBIWXMAAA3XAAAN1wFCKJt4AAAAB3RJTUUH5AYMEy0l8dkqrQAAAvFJREFUKBUB5gIZ/QEAAP8BAAAAAAMG6AD9+hn/GzA//wD//wAAAAD+AAAAAgABAQDl0MEBAwbmAf36GQAAAAAAAQEC9QH//gv/Gi1GFQEC+OoAAAAAAAAAAAABAQAA//8AAAAAAAAAAAD//ggX5tO66gID9AEBFSRxAgYLzRQAAADpAAAAAP7+/gDl0cMPAAAA+wAAAPkbLz39AgICAAAAAAAAAAAs+vU12AEbLz4bAAAA5P8AAAAA//4A5NDDEwEBAO///wABAQEAAP//ABwcMD7hAQEBAAAAAAAAAAAaAgAAAOAAAAAAAQEBAOXRwxUAAADw//8AAgAAAAD//wAAAAAA5OXRwhcAAQEAAAAAAAAAAOICAAAABP3+/gDjzsAT//8A7gAAAAEAAAD+AAAA/wAAAAAAAAAA//8A7ePOwA/+/v4AAAAABAIAAAAAAAAAAAAAAO8AAAABAAAAAAAAAAIAAAABAAAAAAAAAAgAAAD/AAAA8wAAAAAAAAAAAgAAAAAAAAAAAAAAAAAAAA8AAAAEAAAA/gAAAP8AAAADAAAA/gAAAP8AAAAAAAAAAAAAAAACAAAAAAAAAAAAAAAAAAAA7wAAAPsAAAARAAAABAAAAP4AAAAAAAAAAgAAABYAAAAAAAAAAAIAAAD8AwICAB0yQP78/v4GAAAA/wAAAPAAAAD9AAAA/wAAAPr9//8aHTJA6AICAgAAAAD8AgAAADIAAAAAAP//AB4wPvgAAAARAQEA/gEBAP4BAQABAAAAGB0vPeIA//8AAAAAAAAAABAC+vUz1QAAAA8AAAAAAwMDABwwPu3//wAe//8AAv//ABAcMD7lAwMDAAAAAAAAAAAG+vU0+QEBAvUB//4L/xotRhUBAvjqAAAAAAAAAAAAAQEAAP//AAAAAAAAAAAA//4IF+bTuuoCA/QBAQAA/wEAAAAAAwboAP36Gf8bMD//AP//AAAAAP4AAAACAAEBAOXQwQEDBuYB/foZAAAAAAD4I6qbK3+1zQAAAABJRU5ErkJggg==)](https://semgrep.live/)
[![r2c community slack](https://img.shields.io/badge/slack-join-green?style=flat-square)](https://r2c.dev/slack)

| branch | using semgrep docker image | test status          |
| ------------ | ------------------------ | -------------------- |
| `master` | `returntocorp/semgrep:latest`   | [![semgrep-rules-test](https://github.com/returntocorp/semgrep-rules/workflows/semgrep/badge.svg?branch=master)](https://github.com/returntocorp/semgrep-rules/actions?query=workflow%3Asemgrep+branch%3Amaster) |
| `develop` | `returntocorp/semgrep:develop`  | [![semgrep-rules-test-develop](https://github.com/returntocorp/semgrep-rules/workflows/semgrep-develop/badge.svg)](https://github.com/returntocorp/semgrep-rules/actions?query=workflow%3Asemgrep-develop+branch%3Adevelop) |


This repository is the “standard library” for Semgrep rules, but there are many more written by r2c and other contributors available in the [Semgrep Registry](https://semgrep.dev/explore).

## Contributing

If you want to create your own collection of Semgrep rules, feel free to make your own repository and then make a PR adding it to the [list of repositories with Semgrep rules](https://github.com/returntocorp/semgrep-docs/blob/main/docs/awesome.md). This list automatically gets pulled into the [Semgrep Registry](https://semgrep.dev/r) so that lots of Semgrep users can find your rules!

We also welcome rule contributions directly to this repository! Since this repo is maintained by r2c, there are some extra benefits—for example, if there are bug reports for your rule, we’ll also take responsibility to help fix it. If you are submitting to the semgrep-rules repo (rather than your own, separate repository as mentioned above) we’ll ask you to make r2c a joint owner of your contributions. While you still own copyright rights to your rule, joint ownership allows r2c to license these contributions to other [Semgrep Registry](https://semgrep.dev/r) users pursuant to the LGPL 2.1 under the [Commons Clause](https://commonsclause.com/).

If you have more questions, please see the [FAQ section in the Semgrep docs](https://semgrep.dev/docs/faq).

## Security Coverage

`semgrep` features security rules that target [common weaknesses](https://cwe.mitre.org/) and [OWASP categories](https://owasp.org/www-project-top-ten/). Each `security` rule in this repository has metadata fields for `cwe` (and `owasp` when applicable). OWASP coverage for rules in this repository, organized by language, is shown below.

<p align="center">
    <img src="https://web-assets.r2c.dev/semgrep-rules-owasp-coverage-20200520.png" width="500" />
</p>


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

If you want run these rules rather than write them, [see the CI instructions on the Semgrep Registry](https://semgrep.live/packs) (click through to any rule pack). That website is a convenient frontend for this repository.

## Help

Join slack for the fastest answers to your questions! Or contact the team at [semgrep@r2c.dev](mailto:semgrep@r2c.dev).

## Testing Rules

Visit [Testing rules](https://semgrep.dev/docs/writing-rules/testing-rules/) to learn more.

### Github Action To Run Tests

If you fork this repo or create your own, you can add a special [semgrep-rules-test](https://github.com/marketplace/actions/semgrep-rules-test) Github Action to your workflow that will automatically test your rules by running `make test` using the latest version of semgrep.

See ours [here](.github/workflows/semgrep-rules-test.yml)

### Benchmarks
The [benchmark job](https://github.com/returntocorp/semgrep-rules/actions?query=workflow%3Arule-benchmarks) runs every weekend. It uploads a few artifacts, which can be downloaded. If you download the test logs, there are two relevant pieces of information in there: the benchmark table, which roughly shows the performance of every rule that completes in under 60 seconds, and any failed tests are rules that did not complete within 60 seconds.

To run benchmark tests locally, do the following from the root of `semgrep-rules`:
```
pipenv shell
pipenv install --dev
export PYTHONPATH=.
pytest --timeout=60 --rule-directory=[path_to_rule_directory] --git-repo=[git_URL] tests/performance/test_public_repos.py
```
If you omit `--git-repo` from the pytest command, it will run the provided benchmark repo.
