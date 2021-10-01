# Contributions

We welcome contributions to this repo! Please fork and make a pull request; we'll contact you about signing our CLA.

We're happy to help!

- Email us: [semgrep@r2c.dev](mailto:semgrep@r2c.dev)
- [Join our Slack](https://r2c.dev/slack)

## Development Workflow

Pull requests require approval of at least one maintainer and for our [CI jobs to pass](https://github.com/returntocorp/semgrep-rules/actions).

To get a rule ready for review, the CI jobs will check for these things:
1. [Formatting applied by `pre-commit`](#pre-commit)
1. [Passing tests](#tests)
1. [Passing metalinter checks](#metalinter)

In addition, we recommend:
1. [Having a good rule message.](#rule-messages) A good message includes a 1) description of the pattern, 2) a description of why this pattern was detected, 3) and how to fix the issue.
1. [Using namespacing for your rule.](#rule-namespacing)
1. [Metadata.](#rule-metadata) Including references is very helpful!

### `pre-commit`

To install [pre-commit](https://pre-commit.com/):

```
$ python -m pip install pre-commit
```

Then, install the pre-commit hooks:

```
$ pre-commit install
```

To check if `pre-commit` is working as expected,
run the following command:

```
$ pre-commit run --all
```

Once `pre-commit` is set up you may commit code and create pull requests as you would expect.

### Tests

Test files should always accompany new rules. Test file names must match the rule file name, except for the extension. For example, if the rule is in `my-rule.yaml`, the tests should be in `my-rule.js` (or another valid extension for the target language). Inside the test file, expected findings should be marked with a comment that reads `ruleid: my-rule` on the line directly above. You can also include code that should **not** be detected with `ok: my-rule`. Use the appropriate single-line comment syntax for the target language (`#` for Python, `//` for JavaScript, etc.). An example is listed below.

```yaml
rules:
- id: my-rule
  pattern: var $X = "...";
  ...
```

```js
// ruleid: my-rule
var strdata = "hello";
// ok: my-rule
var numdata = 1;
```

For more information, visit [Testing rules](https://semgrep.dev/docs/writing-rules/testing-rules/).

### Metalinter

We use Semgrep to [scan semgrep-rules](https://r2c.dev/blog/2021/how-we-made-semgrep-rules-run-on-semgrep-rules/)! The `semgrep-rule-lints` job will run a few lints on a new rule submission to check for mistakes, performance problems, and best-practices for submitting to this repository.

We have developed a few best-practices for rules submitted to this repository based on how Semgrep CLI users want to interact with the data. The `semgrep-rule-lints` job will check for the following metadata:

- The presence of a `category` metadata field. This is one of {security, best-practice, correctness, maintainability, performance}.
- The presence of a `technology` metadata field. This is usually the library or framework the rule is targeting. If it's for the language itself, just use the language name, e.g., `python`.
- The use of the YAML multiline string operator `>-` when rule messages span multiple lines. This presents the best-looking rule message in the terminal.
- For `security` rules, the presence of `owasp` and `cwe` metadata tags. This lets users group Semgrep results by familiar security tags.

### Rule Messages

A good rule message includes:
1. A description of the pattern (e.g., missing parameter, dangerous flag, out-of-order function calls).
1. A description of why this pattern was detected (e.g., logic bug, introduces a security vulnerability, bad practice).
1. An alternative that resolves the issue (e.g., use another function, validate data first, discard the dangerous flag).

For an example of a good rule message, see [this rule for Django's `mark_safe()`](https://github.com/returntocorp/semgrep-rules/blob/develop/python/django/security/audit/avoid-mark-safe.yaml).

> 'mark_safe()' is used to mark a string as "safe" for HTML output. This disables escaping and could therefore subject the content to XSS attacks. Use 'django.utils.html.format_html()' to build HTML for rendering instead.

### Rule Namespacing

The namespacing format for contributing rules in this directory is `<language>/<framework>/<category>/$MORE`. If a `framework` isn't applicable, use the literal `lang` instead.

`category` is one of:
- security
- correctness
- best-practice
- maintainability
- performance

If a `security` rule is discouraging the use of a bad pattern (such as formatted SQL strings), we recommended appending `audit` to your namespace. This distinguishes it from a `security` rule that is specifically aiming to detect a vulnerability.

Some examples:

```txt
python/lang/security/deserialization/avoid-pyyaml-load.yaml
python/lang/security/audit/eval-detected.yaml
python/flask/security/dangerous-template-string.yaml
python/flask/security/audit/render-template-string.yaml
javascript/lang/best-practice/assigned-undefined.yaml
java/rmi/security/server-dangerous-class-deserizaliation.yaml
```

### Rule Metadata

Rules may contain a `metadata` key. You can put anything in the `metadata` section. The [Semgrep registry](https://semgrep.dev/r) will use the some special keys as described below.

### References

You can add `references` to rule metadata. References are helpful because they can provide additional context to users of the rule. It is good practice to include at least one reference for each rule.

### Security Metadata

Semgrep features security rules that target [common weaknesses](https://cwe.mitre.org/) and [OWASP categories](https://owasp.org/www-project-top-ten/). `security` rules in this repository should have metadata fields for `cwe` (and `owasp` when applicable).

### Sample rule with metadata

```yaml
rules:
- id: render-template-string
  ...
  metadata:
    cwe: "CWE-96: Improper Neutralization of Directives in Statically Saved Code ('Static Code Injection')"
    owasp: 'A01:2017 Injection'
    references:
    - https://nvisium.com/blog/2016/03/09/exploring-ssti-in-flask-jinja2.html
```
