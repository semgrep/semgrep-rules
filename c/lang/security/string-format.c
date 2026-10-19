#include  <stdio.h>
#include <stdlib.h>

void f0(char *var)
{
	// ok: string-format
	printf("%s\n", argv[1]);

	// ruleid: string-format
	printf(argv[1]);
}

void f1(FILE *fd, char *var) {
  // ok: string-format
  fprintf(fd, "%s\n", var);

  // ruleid: string-format
  fprintf(fd, var);
}

void f2(char *var) {
  char *buf = (char *)malloc(100);

  // ok: string-format
  sprintf(buf, "%s\n", var);
  // ok: string-format
  snprintf(buf, 100, "%s\n", var);

  // ruleid: string-format
  sprintf(buf, var);
  // ruleid: string-format
  snprintf(buf, 100, var);
}