# semgrep-rules

[![powered by semgrep](https://img.shields.io/badge/powered%20by-semgrep-1B2F3D?labelColor=lightgrey&link=https://semgrep.live/&style=flat-square&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAAA0AAAAOCAYAAAD0f5bSAAAABmJLR0QA/gD+AP+cH+QUAAAACXBIWXMAAA3XAAAN1wFCKJt4AAAAB3RJTUUH5AYMEy0l8dkqrQAAAvFJREFUKBUB5gIZ/QEAAP8BAAAAAAMG6AD9+hn/GzA//wD//wAAAAD+AAAAAgABAQDl0MEBAwbmAf36GQAAAAAAAQEC9QH//gv/Gi1GFQEC+OoAAAAAAAAAAAABAQAA//8AAAAAAAAAAAD//ggX5tO66gID9AEBFSRxAgYLzRQAAADpAAAAAP7+/gDl0cMPAAAA+wAAAPkbLz39AgICAAAAAAAAAAAs+vU12AEbLz4bAAAA5P8AAAAA//4A5NDDEwEBAO///wABAQEAAP//ABwcMD7hAQEBAAAAAAAAAAAaAgAAAOAAAAAAAQEBAOXRwxUAAADw//8AAgAAAAD//wAAAAAA5OXRwhcAAQEAAAAAAAAAAOICAAAABP3+/gDjzsAT//8A7gAAAAEAAAD+AAAA/wAAAAAAAAAA//8A7ePOwA/+/v4AAAAABAIAAAAAAAAAAAAAAO8AAAABAAAAAAAAAAIAAAABAAAAAAAAAAgAAAD/AAAA8wAAAAAAAAAAAgAAAAAAAAAAAAAAAAAAAA8AAAAEAAAA/gAAAP8AAAADAAAA/gAAAP8AAAAAAAAAAAAAAAACAAAAAAAAAAAAAAAAAAAA7wAAAPsAAAARAAAABAAAAP4AAAAAAAAAAgAAABYAAAAAAAAAAAIAAAD8AwICAB0yQP78/v4GAAAA/wAAAPAAAAD9AAAA/wAAAPr9//8aHTJA6AICAgAAAAD8AgAAADIAAAAAAP//AB4wPvgAAAARAQEA/gEBAP4BAQABAAAAGB0vPeIA//8AAAAAAAAAABAC+vUz1QAAAA8AAAAAAwMDABwwPu3//wAe//8AAv//ABAcMD7lAwMDAAAAAAAAAAAG+vU0+QEBAvUB//4L/xotRhUBAvjqAAAAAAAAAAAAAQEAAP//AAAAAAAAAAAA//4IF+bTuuoCA/QBAQAA/wEAAAAAAwboAP36Gf8bMD//AP//AAAAAP4AAAACAAEBAOXQwQEDBuYB/foZAAAAAAD4I6qbK3+1zQAAAABJRU5ErkJggg==)](https://semgrep.dev/)
[![r2c community slack](https://img.shields.io/badge/slack-join-green?style=flat-square)](https://r2c.dev/slack)

| branch | using semgrep docker image | test status          |
| ------------ | ------------------------ | -------------------- |
| `develop` | `returntocorp/semgrep:develop`  | [![semgrep-rules-test-develop](https://github.com/returntocorp/semgrep-rules/workflows/semgrep-develop/badge.svg)](https://github.com/returntocorp/semgrep-rules/actions?query=workflow%3Asemgrep-develop+branch%3Adevelop) |

Welcome! This repository is the standard library for [Semgrep](https://semgrep.dev/) rules, but there are many more written by [r2c](https://r2c.dev/) and other contributors available in the [Semgrep Registry](https://semgrep.dev/explore). If there is a specific rule you are looking for, you can also search the [Semgrep registry](https://semgrep.dev/r). To contribute, find details about contributing in the [Contributing to Semgrep rules](https://semgrep.dev/docs/contributing/contributing-to-semgrep-rules-repository/) documentation.

## Using Semgrep rules repository

Run existing and custom Semgrep rules locally with the Semgrep command line interface (Semgrep CLI) or continuously with Semgrep in CI while using Semgrep App. To start using Semgrep rules, see [Semgrep tutorial](https://semgrep.dev/learn), [Getting started with Semgrep CLI](https://semgrep.dev/docs/getting-started/), and [Getting started with Semgrep App](https://semgrep.dev/docs/semgrep-app/getting-started-with-semgrep-app/).

## Contributing

We welcome Semgrep rule contributions directly to this repository! If you are submitting to the `semgrep-rules` repository we’ll ask you to make r2c a joint owner of your contributions. While you still own copyright rights to your rule, joint ownership allows r2c to license these contributions to other [Semgrep Registry](https://semgrep.dev/r) users pursuant to the LGPL 2.1 under the [Commons Clause](https://commonsclause.com/). Full [license details](https://github.com/returntocorp/semgrep-rules/blob/develop/LICENSE) here.

:::info
To contribute, find details about contributing in the **[Contributing to Semgrep rules](https://semgrep.dev/docs/contributing/contributing-to-semgrep-rules-repository/)** documentation.
:::

You can also contact us at support@r2c.dev to make Semgrep rule contributions. We will import your rules for everyone to use!

## Additional information

### Help

Join [Slack](https://r2c.dev/slack) for the fastest answers to your questions! Or contact the team at support@r2c.dev.

### GitHub action to run tests

If you fork this repository or create your own, you can add a special [semgrep
-rules-test](https://github.com/marketplace/actions/semgrep-rules-test) GitHub Action to your workflow that will automatically test your rules using the latest version of Semgrep. See our [semgrep-rules-test](https://github.com/returntocorp/semgrep-rules/blob/develop/.github/workflows/semgrep-rules-test.yml).

### Benchmarks

You can evaluate the quality of both Semgrep registry and your own rules. The [benchmark job](https://github.com/returntocorp/semgrep-rules/actions?query=workflow%3Arule-benchmarks) runs every weekend. This job uploads a few artifacts, which can be downloaded. If you download the test logs, there are two relevant pieces of information: 

- The benchmark table, which roughly shows the performance of every rule that completes in under 60 seconds.
- Any failed tests are rules that did not complete within 60 seconds.

To run benchmark tests locally, use the following commands in the root directory of `semgrep-rules` local repository clone.
```bash
pipenv shell
pipenv install --dev
export PYTHONPATH=.
pytest --timeout=60 --rule-directory=[path_to_rule_directory] --git-repo=[git_URL] tests/performance/test_public_repos.py
```

To run these in our benchmark repository, skip `--git-repo` from the pytest command (last command in the code snippet above).

### Rulesets

Rulesets are groups of rules organized by purpose, language, or framework sourced from the Semgrep Registry. If you want to modify existing rulesets or create your own, please contact us at support@r2c.dev.
