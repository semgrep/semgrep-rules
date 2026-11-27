rules:
  - id: xss-innerhtml-taint
    message: "Potential XSS vulnerability: User-controlled data flows to innerHTML without sanitization"
    languages:
      - javascript
      - typescript
    severity: ERROR
    mode: taint
    pattern-sources:
      - pattern-either:
          # URL parameters - user controlled
          - pattern: new URLSearchParams($WINDOW.location.search).get($KEY)
          - pattern: new URLSearchParams($WINDOW.location.search).get(...)
          - pattern: new URL($WINDOW.location.href).searchParams.get($KEY)
          - pattern: $WINDOW.location.search
          - pattern: $WINDOW.location.hash
          - pattern: $WINDOW.location.href
          - pattern: document.location.search
          - pattern: document.location.hash
          - pattern: document.location.href
          # Form inputs - user controlled
          - pattern: $INPUT.value
          - pattern: $INPUT.getAttribute($ATTR)
          - pattern: document.getElementById($ID).value
          - pattern: document.querySelector($SELECTOR).value
          - pattern: document.querySelectorAll($SELECTOR)[...].value
          # Event data - user controlled
          - pattern: $EVENT.target.value
          - pattern: $EVENT.data
          - pattern: $EVENT.detail
          # Storage - potentially user controlled
          - pattern: localStorage.getItem($KEY)
          - pattern: sessionStorage.getItem($KEY)
          - pattern: $OBJ.getItem($KEY)
          # Cookies - user controlled
          - pattern: document.cookie
          # API responses - potentially untrusted
          - pattern: await $RESPONSE.json()
          - pattern: await $RESPONSE.text()
          - pattern: $RESPONSE.json()
          - pattern: $RESPONSE.text()
          - pattern: await fetch(...)
          # PostMessage - cross-origin data
          - pattern: $EVENT.data
          # Common helper functions that return user input
          - pattern: getUserInput(...)
          - pattern: getQueryParam(...)
          - pattern: getUrlParam(...)
          - pattern: getCookie(...)
          - pattern: getStorage(...)
          - pattern: getRequestParam(...)
    pattern-sinks:
      - pattern-either:
          - pattern: $OBJ.innerHTML = $SOURCE
          - pattern: $OBJ.innerHTML = $SOURCE + ...
          - pattern: $OBJ.innerHTML = ... + $SOURCE
          - pattern: $OBJ.innerHTML = ... + $SOURCE + ...
          - pattern: $OBJ.innerHTML += $SOURCE
          - pattern: $OBJ.outerHTML = $SOURCE
          - pattern: $OBJ.insertAdjacentHTML($POS, $SOURCE)
          - pattern: $OBJ.insertAdjacentHTML($POS, ... + $SOURCE)
    pattern-sanitizers:
      - pattern-either:
          # DOMPurify - industry standard
          - pattern: DOMPurify.sanitize($SOURCE)
          - pattern: DOMPurify.sanitize($SOURCE, $CONFIG)
          # Other sanitization libraries
          - pattern: $SANITIZER.sanitize($SOURCE)
          - pattern: sanitizeHtml($SOURCE)
          - pattern: escapeHtml($SOURCE)
          - pattern: htmlEscape($SOURCE)
          - pattern: xss($SOURCE)
          # Manual escaping patterns
          - pattern: $SOURCE.replace(/[<>]/g, $REPL)
          - pattern: $SOURCE.replace(/&/g, $REPL)
          - pattern: $SOURCE.replace(/"/g, $REPL)
          - pattern: $SOURCE.replace(/'/g, $REPL)
          - pattern: $SOURCE.replace(/</g, "&lt;")
          - pattern: $SOURCE.replace(/>/g, "&gt;")
          - pattern: $SOURCE.replace(/&/g, "&amp;")
          - pattern: $SOURCE.replace(/"/g, "&quot;")
          - pattern: $SOURCE.replace(/'/g, "&#x27;")
          - pattern: $SOURCE.replace(/\//g, "&#x2F;")
          # Encoding
          - pattern: encodeURIComponent($SOURCE)
          - pattern: encodeURI($SOURCE)
          # Safe alternatives
          - pattern: $SOURCE.textContent
          - pattern: $SOURCE.innerText
          # React/Vue sanitization
          - pattern: sanitize($SOURCE)
          - pattern: $SANITIZER.sanitize($SOURCE, $CONFIG)
    # Exclude false positives - safe contexts
    pattern-not-inside:
      - |
        // Safe: Using textContent instead
        $OBJ.textContent = ...
      - |
        // Safe: Already sanitized
        const $VAR = DOMPurify.sanitize(...);
        ...
        $OBJ.innerHTML = $VAR;
      - |
        // Safe: Hardcoded strings
        $OBJ.innerHTML = "<div>...</div>";
      - |
        // Safe: Template literals with no user input
        $OBJ.innerHTML = `<div>${$CONSTANT}</div>`;
      - |
        // Safe: JSON.stringify output (escaped)
        $OBJ.innerHTML = JSON.stringify(...);
    metadata:
      category: security
      cwe: "CWE-79: Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')"
      owasp: "A03:2021 – Injection"
      technology:
        - javascript
        - typescript
      references:
        - https://owasp.org/www-community/attacks/xss/
        - https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html

