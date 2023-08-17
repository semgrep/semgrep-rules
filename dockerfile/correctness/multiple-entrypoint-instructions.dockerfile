# cf. https://github.com/hadolint/hadolint/wiki/DL4004

FROM busybox
ENTRYPOINT /bin/true
RUN echo hello
# ruleid: multiple-entrypoint-instructions
ENTRYPOINT /bin/false
