# Contributions

We welcome contributions to this repo! Please fork and make a pull request; we'll contact you about signing our CLA.

We're happy to help [semgrep@r2c.dev](mailto:semgrep@r2c.dev)

## Development Workflow

Pull requests require approval of at least one maintainer and [CI to be passing](https://github.com/returntocorp/semgrep-rules/actions).

Getting a new rule ready for review is easy to do. The CI jobs will check for these things:
1. [Formatting applied by `pre-commit`](#pre-commit)
1. [Passing tests](#tests)

In addition, we recommend:
1. [Having a good rule message.](#rule-messages) A good message includes a description of the pattern, a description of why this pattern was detected, and an alternative that resolves the issue.
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

Test files should accompany new rules. Test file names must match the rule file name, except for the extension. For example, if the rule is in `my-rule.yaml`, the tests should be in `my-rule.js` (or another valid extension for the target language). Inside the test file, expected findings should be marked with a comment that reads `ruleid: my-rule` on the line directly above. You can also include code that should **not** be detected with `ok: my-rule`. Use the appropriate single-line comment syntax for the target language (`#` for Python, `//` for JavaScript, etc.). An example is listed below.

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

### Rule Messages

A good rule message includes:
1. A description of the pattern (e.g., missing parameter, dangerous flag, out-of-order function calls).
1. A description of why this pattern was detected (e.g., logic bug, introduces a security vulnerability, bad practice).
1. An alternative that resolves the issue (e.g., use another function, validate data first, discard the dangerous flag).

For an example of a good rule message, see [this rule for Django's `mark_safe()`](https://github.com/returntocorp/semgrep-rules/blob/develop/python/django/security/audit/avoid-mark-safe.yaml).

> 'mark_safe()' is used to mark a string as "safe" for HTML output. This disables escaping and could therefore subject the content to XSS attacks. Use 'django.utils.html.format_html()' to build HTML for rendering instead.

### Rule Namespacing

The namespacing format for contributing rules in this directory is `<language>/<framework>/<category>/$MORE`. If a `framework` isn't applicable, use `lang` instead.

`category` is one of:
- security
- correctness
- best-practice
- maintainability
- performance

If a `security` rule is discouraging the use of a bad pattern (such as formatted SQL strings), it is recommended to append `audit` to your namespace. This distinguishes it from a `security` rule that is specifically aiming to detect a vulnerability.

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

### Security Coverage

Semgrep features security rules that target [common weaknesses](https://cwe.mitre.org/) and [OWASP categories](https://owasp.org/www-project-top-ten/). `security` rules in this repository should have metadata fields for `cwe` (and `owasp` when applicable).

### Sample rule with metadata

```yaml
rules:
- id: render-template-string
  ...
  metadata:
    cwe: "CWE-96: Improper Neutralization of Directives in Statically Saved Code ('Static Code Injection')"
    owasp: 'A1: Injection'
    references:
    - https://nvisium.com/blog/2016/03/09/exploring-ssti-in-flask-jinja2.html
```
