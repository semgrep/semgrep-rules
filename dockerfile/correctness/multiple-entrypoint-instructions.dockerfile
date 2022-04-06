# cf. https://github.com/hadolint/hadolint/wiki/DL4004

FROM busybox
# ruleid: multiple-entrypoint-instructions
ENTRYPOINT /bin/true
ENTRYPOINT /bin/false
