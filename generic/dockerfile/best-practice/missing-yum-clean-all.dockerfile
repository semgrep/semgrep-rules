FROM centos

# ok: missing-yum-clean-all
RUN yum update \
    && yum install foo-1.0 \
    && yum clean all

# ok: missing-yum-clean-all
RUN yum update && \
    yum install foo-1.0 && \
    yum clean all

# ruleid: missing-yum-clean-all
RUN yum install foo-1.0
