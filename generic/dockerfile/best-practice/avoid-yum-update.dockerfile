# cf. https://github.com/hadolint/hadolint/wiki/DL3031

FROM centos

# ruleid: avoid-yum-update
RUN yum update \
    && yum install foo-1.0 \
    && yum clean all

# ok: avoid-yum-update
RUN yum install foo=1.0:
