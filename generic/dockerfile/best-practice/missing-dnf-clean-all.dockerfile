# cf. https://github.com/hadolint/hadolint/wiki/DL3038

FROM centos

# ok: missing-dnf-clean-all
RUN dnf update \
    && dnf install foo-1.0 \
    && dnf clean all

# ok: missing-dnf-clean-all
RUN dnf update && \
    dnf install foo-1.0 && \
    dnf clean all

# ruleid: missing-dnf-clean-all
RUN dnf install foo-1.0
