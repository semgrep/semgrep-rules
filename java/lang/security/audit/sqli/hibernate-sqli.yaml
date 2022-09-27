rules:
- id: hibernate-sqli
  pattern-either:
  - patterns:
    - pattern-either:
      - pattern-inside: |
          String $SQL = $X + $Y;
          ...
      - pattern-inside: |
          String $SQL = String.format(...);
          ...
      - pattern-inside: |
          $VAL $FUNC(...,String $SQL,...) {
          ...
          }
    - pattern-not-inside: |
        String $SQL = "..." + "...";
        ...
    - pattern: org.hibernate.criterion.Restrictions.sqlRestriction($SQL,...)
  - pattern: org.hibernate.criterion.Restrictions.sqlRestriction(String.format(...),...)
  - patterns:
    - pattern: org.hibernate.criterion.Restrictions.sqlRestriction($X + $Y,...)
    - pattern-not: org.hibernate.criterion.Restrictions.sqlRestriction("..." + "...",...)
  - patterns:
    - pattern-either:
      - patterns:
        - pattern-either:
          - pattern-inside: |
              String $SQL = $X + $Y;
              ...
          - pattern-inside: |
              String $SQL = String.format(...);
              ...
          - pattern-inside: |
              $TYPE $FUNC(...,String $SQL,...) {
                ...
              }
        - pattern-not-inside: |
            String $SQL = "..." + "...";
            ...
        - pattern: $SESSION.$METHOD($SQL,...)
      - pattern: |
          $SESSION.$METHOD(String.format(...),...);
      - pattern: |
          $SESSION.$METHOD($X + $Y,...);
    - pattern-either:
      - pattern-inside: |
          org.hibernate.Session $SESSION = ...;
          ...
      - pattern-inside: |
          $TYPE $FUNC(...,org.hibernate.Session $SESSION,...) {
            ...
          }
    - pattern-not: |
        $SESSION.$METHOD("..." + "...",...);
    - metavariable-regex:
        metavariable: $METHOD
        regex: ^(createQuery|createSQLQuery)$
  message: >-
    Detected a formatted string in a SQL statement. This could lead to SQL
    injection if variables in the SQL statement are not properly sanitized.
    Use a prepared statements (java.sql.PreparedStatement) instead. You
    can obtain a PreparedStatement using 'connection.prepareStatement'.
  metadata:
    cwe:
    - "CWE-89: Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')"
    source-rule-url: https://find-sec-bugs.github.io/bugs.htm#SQL_INJECTION_HIBERNATE
    asvs:
      section: V5 Stored Cryptography Verification Requirements
      control_id: 5.3.5 Insecure Custom Algorithm
      control_url: https://github.com/OWASP/ASVS/blob/master/4.0/en/0x13-V5-Validation-Sanitization-Encoding.md#v53-output-encoding-and-injection-prevention-requirements
      version: '4'
    category: security
    technology:
    - hibernate
    owasp:
    - A01:2017 - Injection
    - A03:2021 - Injection
    references:
    - https://owasp.org/Top10/A03_2021-Injection
    cwe2022-top25: true
    cwe2021-top25: true
    subcategory:
    - audit
    likelihood: LOW
    impact: HIGH
    confidence: LOW
  languages: [java]
  severity: WARNING
