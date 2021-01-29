# cf. https://github.com/hadolint/hadolint/wiki/DL3030

FROM centos
# ruleid: missing-yum-assume-yes-switch
RUN yum install httpd-2.24.4 && yum clean all

# ok: missing-yum-assume-yes-switch
RUN yum install -y httpd-2.24.4 && yum clean all

# ok: missing-yum-assume-yes-switch
RUN yum install --downloadonly -y httpd-2.24.4 python

# ok: missing-yum-assume-yes-switch
RUN yuminstall -y httpd-2.24.4

# ok: missing-yum-assume-yes-switch
RUN yum install -y --downloadonly \
    python3 \
    python3-pip \
    && yum clean all

# ruleid: missing-yum-assume-yes-switch
RUN yum install --downloadonly \
    python3 \
    python3-pip \
    && yum clean all

# ok: missing-yum-assume-yes-switch
RUN yum install --assumeyes \
    --downloadonly \
    python3 \
    python3-pip \
    && yum clean all
