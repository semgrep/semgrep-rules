FROM busybox

# ruleid: last-user-is-root
USER root
RUN git clone https://github.com/returntocorp/semgrep
RUN pip3 install semgrep
RUN semgrep -f p/xss
# USER swuser
