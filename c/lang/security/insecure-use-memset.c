void badcode(char *password, size_t bufferSize) {
  char token[256];
  init(token, password);
  // ruleid: insecure-use-memset
  memset(password, ' ', strlen(password));
  // ruleid: insecure-use-memset
  memset(token, ' ', strlen(localBuffer));
  free(password);
}

void okcode(char *password, size_t bufferSize) {
  char token[256];
  init(token, password);
  // ok: insecure-use-memset
  memset_s(password, bufferSize, ' ', strlen(password));
  // ok: insecure-use-memset
  memset_s(token, sizeof(token), ' ', strlen(localBuffer));
  free(password);
}