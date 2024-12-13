# semgrep-rules

[![powered by semgrep](https://img.shields.io/badge/powered%20by%20semgrep-2ACFA6)](https://semgrep.dev/)
<a href="https://go.semgrep.dev/slack">
<img src="https://img.shields.io/badge/community%20slack-3.5k%20members-green?style=flat-square" alt="Join Semgrep community Slack" />
</a>

Welcome! This repository is the standard library for open source [Semgrep](https://semgrep.dev/) rules.

In addition to the rules in this repository, the [Semgrep Registry](https://semgrep.dev/explore) offers proprietary [Pro rules](https://semgrep.dev/products/semgrep-code/pro-rules) that enable interfile and interprocedural analysis.

- Find rules: search for open source and Pro rules through the [Semgrep registry search](https://semgrep.dev/r).
- Use rules: Scan your code with these rules through [Semgrep AppSec Platform](https://semgrep.dev/login)
- Contribute to rules: see [Contributing to Semgrep rules](https://semgrep.dev/docs/contributing/contributing-to-semgrep-rules-repository/) for more information.

## Using the Semgrep rules repository

To start writing and using Semgrep rules, see [Learn Semgrep syntax](https://semgrep.dev/learn) and [Writing rules](https://semgrep.dev/docs/writing-rules/overview/). Then, run existing and custom Semgrep rules locally with the [Semgrep command line interface (Semgrep CLI)](https://semgrep.dev/docs/getting-started/) or [continuously with Semgrep in CI while using Semgrep AppSec Platform](https://semgrep.dev/docs/semgrep-app/getting-started-with-semgrep-app/).

## Writing Semgrep rules

See [Writing rules](https://semgrep.dev/docs/writing-rules/overview/) for information including:

- Pattern syntax, describing what Semgrep patterns can do in detail, and example use cases of the ellipsis operator, metavariables.
- Rule syntax, describing Semgrep YAML rule files, which can have multiple patterns, detailed output messages, and autofixes. The syntax allows the composition of individual patterns with boolean operators.

You can also learn how to write rules using the [interactive, example-based Semgrep rule tutorial](https://semgrep.dev/learn).

## Contributing

We welcome Semgrep rule contributions directly to this repository! When submitting your contribution, you grant Semgrep, Inc. a license to use, modify, and distribute your contribution under the [Semgrep Rules License v. 1.0](https://semgrep.dev/legal/rules-license). This ensures your rule can be shared with other Semgrep Registry users.

To contribute, please review our  **[Contributing to Semgrep rules](https://semgrep.dev/docs/contributing/contributing-to-semgrep-rules-repository/)** guidelines.

You can also reach out to us at support@semgrep.com, and we will help import your rules for others to use!


## Additional information

### Help

Join [Slack](https://go.semgrep.dev/slack) for the fastest answers to your questions! Or contact the team at support@semgrep.com.

### GitHub action to run tests

If you fork this repository or create your own, you can add a GitHub Action to your workflow that will automatically test your rules using the latest version of Semgrep. See our [semgrep-rules-test example](https://github.com/returntocorp/semgrep-rules/blob/develop/.github/workflows/semgrep-rules-test.yml).

### Rulesets

Rulesets are groups of rules organized by purpose, language, or framework sourced from the Semgrep Registry. If you want to modify existing rulesets or create your own, please contact us at support@semgrep.com.
