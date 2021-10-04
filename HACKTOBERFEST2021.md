<p align="center"><img src="https://hacktoberfest.digitalocean.com/_nuxt/img/logo-hacktoberfest-full.f42e3b1.svg" width="500px" /></p>

We're participating in Hacktoberfest 2021! This is our first year participating, and we hope it's a tradition for many years to come!

We want your help securing software everywhere. One of the best ways to do that is to leverage your expertise developing novel [Semgrep rules](https://semgrep.dev/r) for anyone to use. If you want to help, consider making a pull request to this repository with a new Semgrep rule. We accept rule contributions year-round, so feel free to make a PR at any time!

We will be active in our [Slack group](https://r2c.dev/slack). Come hang out in the `#rules` channel! Ask questions, collaborate, or just say hi!

## The Hacktoberfest Project

For Hacktoberfest, we are inviting everyone to participate in a project that will be ongoing throughout October: we'll be battle testing Semgrep's new [taint mode](https://semgrep.dev/docs/writing-rules/data-flow/#taint-tracking) on open-source code. We want to use taint mode this month to:
- Scan tons of open source code to find new sources and sinks
- Write new Semgrep rules based on the sources and sinks found
- Fix bugs in open source code
- Find and report bugs in Semgrep's taint mode

There are two main ways you can particpate:
1. Triage a list of sources and sinks that we already have
1. Create a new list of sources and sinks

### Triage sources and sinks

We have [lists of sources and sinks](https://docs.google.com/spreadsheets/d/1k-VGANT6q-zbQVmvkLFpXvUiATyYzIA0xUbNPA_BwXo/edit) generated from open source code. These are found using a generic taint rule that will enumerate all functions that are touched by user input. An example of a generic taint rule is listed below. This rule will find every function touched by `flask.request.args`, one way in which query parameters are accessed in Flask. You can also play with it in the [Semgrep Playground](https://semgrep.dev/s/Ev48).

```yaml
rules:
  - id: generic-sinks-flask
    languages:
      - python
    message: $SINK
    mode: taint
    pattern-sinks:
      - pattern: $SINK(...)
    pattern-sources:
      - pattern-either:
          - pattern: flask.request.args.get(...)
          - pattern: flask.request.args[...]
    severity: INFO
```

Most of the sinks will be unintersting. However, some of them may have security implications - we want your help finding these!

The current list of sources and sinks are on this public Google spreadsheet here: https://docs.google.com/spreadsheets/d/1k-VGANT6q-zbQVmvkLFpXvUiATyYzIA0xUbNPA_BwXo/edit

If you're investigating a finding, mark the row as "taken". See https://docs.google.com/document/d/17qhCJnutJfheZF06jv8qgOo0GyDTgOWcMuOu6rdmfEQ/edit for more details.

**Writing a new Semgrep rule**

If you discover a pattern that you think will make a good Semgrep rule, follow the guidelines in [CONTRIBUTING.md](https://github.com/returntocorp/semgrep-rules/blob/develop/CONTRIBUTING.md) for making a PR to this repository. You can use any IDE to develop Semgrep rules, or you can use the [Semgrep Playground](https://semgrep.dev/editor).

### Create a new list of sources and sinks

The list of sources and sinks is not complete! We have generated a few lists, but can always use more! In particular, we are interested in lists that
1. Use interesting sources
1. Cover repositories we haven't scanned yet
1. Cover a framework we haven't generated lists for yet. See [issues labeled 'Hacktoberfest'](https://github.com/returntocorp/semgrep-rules/issues?q=is%3Aissue+is%3Aopen+label%3Ahacktoberfest) on this repository for tickets with frameworks we're interested in. Also, feel free to make new issues with frameworks that *you're* interested in!

To scan open source code, use whatever infrastructure you have at your disposal. We frequently search for code using the [GitHub Search API](https://docs.github.com/en/rest/reference/search). You can use the web UI or a [script like this one that we use](https://gist.github.com/minusworld/fa69a633e33685148de02f4d4e454aa3).

### What to do if you find a security vulnerability

If you find a security vulnerability in an open source project, always follow a [responsible disclosure](https://en.wikipedia.org/wiki/Responsible_disclosure) policy. If the project has a method for reporting security vulnerabilities privately, use that to work with the maintainers to issue a fix. If a method for privately reporting doesn't exist, do your best to privately contact the maintainers. E.g., check the `git log` for emails. Make a pull request fixing the problem or file an issue on the repository as a last resort!
