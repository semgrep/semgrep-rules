#include <cstdio>
#define BUFFER_SIZE 1024

void test_001() {
  char buf[BUFFER_SIZE];
  // ruleid: unbounded-copy-to-stack-buffer
  if (gets(buf) == NULL) {
    // ...
  }
}

void test_002() {
  char buf[BUFFER_SIZE];
  // ruleid: unbounded-copy-to-stack-buffer
  if (std::gets(buf) == NULL) {
    // ...
  }
}

void test_003(void) {
  char buf[BUFFER_SIZE];
  // ruleid: unbounded-copy-to-stack-buffer
  if (1 != fscanf(stdin, "%s", buf)) {
    // ...
  }
}

void test_003_valist(void) {
  char buf[BUFFER_SIZE];
  // ruleid: unbounded-copy-to-stack-buffer
  if (1 != fscanf(stdin, "%d%d%s", 1, 2, buf)) {
    // ...
  }
}

void test_003_stmt(void) {
  char buf[BUFFER_SIZE];
  // ruleid: unbounded-copy-to-stack-buffer
  fscanf(stdin, "%d%d%s", 1, 2, buf);
}

void test_004(void) {
  char buf[BUFFER_SIZE];
  // ok: unbounded-copy-to-stack-buffer
  if (1 != fscanf(stdin, "%d", buf)) {
    // ...
  }
}

void test_005(const char *name) {
  char filename[128];
  // ruleid: unbounded-copy-to-stack-buffer
  sprintf(filename, "%s", name);
}

void test_006(const char *name) {
  char filename[128];
  // ok: unbounded-copy-to-stack-buffer
  sprintf(filename, "%d", name);
}

void test_007(wchar_t *name) {
  char filename[128];
  // ruleid: unbounded-copy-to-stack-buffer
  fwscanf(stdin, L"foo%sbar", filename);
}

void foo() {
  char buf[64];
  // ruleid: unbounded-copy-to-stack-buffer
  gets(buf);
}

void foo() {
  char buf[64];
  // ok: unbounded-copy-to-stack-buffer
  fgets(buf, 63, stdin);
}

void foo() {
  char buf[128];
  int n;
  // ruleid: unbounded-copy-to-stack-buffer
  fscanf(stdin, "%dfoo%sbar", n, buf);
  // ruleid: unbounded-copy-to-stack-buffer
  fscanf(stdin, "%sbar", n, buf);
  // ruleid: unbounded-copy-to-stack-buffer
  fscanf(stdin, "foo%s", n, buf);
}

void foo() {
  char buf[128];
  int n;
  // ok: unbounded-copy-to-stack-buffer
  fscanf(stdin, "%dfoo%10sbar", n, buf);
}

void foo() {
  char buf[128];
  int n;
  // todoruleid: unbounded-copy-to-stack-buffer
  fscanf(stdin, "%dfoo%1024sbar", n, buf);
}

void foo() {
  char buf[128];
  // ruleid: unbounded-copy-to-stack-buffer
  fscanf(stdin, "%sfoo%%s", buf);

  // We don't scan all '%' characters so we don't understand that
  // '%%%s' means "literal '%', followed by '%s'"
  // todook: unbounded-copy-to-stack-buffer
  fscanf(stdin, "%sfoo%%%s", buf);
}

void foo() {
  char buf[64];
  va_list ap;
  va_start(ap, buf);
  // ruleid: unbounded-copy-to-stack-buffer
  vscanf("%s", ap);
  va_end(ap);
}

void foo() {
  char buf[64];
  va_list ap;
  va_start(ap, buf);
  // ruleid: unbounded-copy-to-stack-buffer
  vfscanf(stdin, "%s", ap);
  va_end(ap);
}

void foo(char *str) {
  char buf[0];
  // ruleid: unbounded-copy-to-stack-buffer
  sscanf(str, "%s", buf);

  // todook: unbounded-copy-to-stack-buffer
  sscanf("constant string", "%s", buf);

  va_list ap;
  va_start(ap, fmt);
  // todoruleid: unbounded-copy-to-stack-buffer
  vsscanf(str, "%s", buf);
  va_end(ap);

  va_list ap;
  va_start(ap, fmt);
  // ok: unbounded-copy-to-stack-buffer
  vsscanf("constant string", "%s", buf);
  va_end(ap);
}
