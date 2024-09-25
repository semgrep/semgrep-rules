FROM busybox


RUN git clone https://github.com/returntocorp/semgrep
RUN pip3 install semgrep
RUN semgrep -f p/xss
USER swuser
USER root

USER user1
# ruleid: last-user-is-root
USER root
