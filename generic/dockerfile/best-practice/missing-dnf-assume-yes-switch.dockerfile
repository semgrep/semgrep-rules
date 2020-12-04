# cf. https://github.com/hadolint/hadolint/wiki/DL3038

FROM centos
# ruleid: missing-dnf-assume-yes-switch
RUN dnf install httpd-2.24.4 && dnf clean all

# ok: missing-dnf-assume-yes-switch
RUN dnf install -y httpd-2.24.4 && dnf clean all

# ok: missing-dnf-assume-yes-switch
RUN dnf install --downloadonly -y httpd-2.24.4 python

# ok: missing-dnf-assume-yes-switch
RUN dnfinstall -y httpd-2.24.4

# ok: missing-dnf-assume-yes-switch
RUN dnf install -y --downloadonly \
    python3 \
    python3-pip \
    && dnf clean all

# ruleid: missing-dnf-assume-yes-switch
RUN dnf install --downloadonly \
    python3 \
    python3-pip \
    && dnf clean all

# ok: missing-dnf-assume-yes-switch
RUN dnf install --assumeyes \
    --downloadonly \
    python3 \
    python3-pip \
    && dnf clean all
