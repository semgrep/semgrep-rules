
rules:
  - id: python.gitpython.argument-injection
    languages:
      - python
    mode: taint
    severity: WARNING
    message: >-
      Potential CWE-88 argument injection. A function parameter flows
      into a GitPython command argument. Verify that the value is
      validated and cannot be interpreted as a Git command-line option.
    metadata:
      cwe:
        - "CWE-88"
      category: security
      technology:
        - gitpython
      confidence: MEDIUM

    # Treat function parameters as potentially untrusted.
    pattern-sources:
      - patterns:
          - pattern-inside: |
              def $FUNC(..., $PARAM, ...):
                ...
          - focus-metavariable: $PARAM

    # Match arguments passed to ANY GitPython command.
    pattern-sinks:
      - patterns:
          - pattern: $REPO.git.$COMMAND(..., $ARG, ...)
          - focus-metavariable: $ARG
