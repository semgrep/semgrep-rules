function escapeQuotes(s) {
    // ruleid:incomplete-sanitization
    return s.replace("'", "''");
}

function removeTabs(s) {
    // ruleid:incomplete-sanitization
    return s.replace('\t', "");
}

function escapeHtml(html) {
  // ruleid:incomplete-sanitization
  return html
    .replace("<", "")
    .replace(">", "");
}

function okTest(s) {
    return s.replace("foo", "bar");
}

function okEscapeQuotes(s) {
    return s.replace(/'/g, "''");
}
