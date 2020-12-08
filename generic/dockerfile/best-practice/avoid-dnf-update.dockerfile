# cf. https://github.com/hadolint/hadolint/wiki/DL3039

FROM centos

# ruleid: avoid-dnf-update
RUN dnf update \
    && dnf install foo-1.0 \
    && dnf clean all

# ok: avoid-dnf-update
RUN dnf install foo=1.0:
