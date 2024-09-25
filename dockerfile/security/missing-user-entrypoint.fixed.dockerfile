FROM busybox

# uncomment for ok
#USER notroot

RUN git clone https://github.com/returntocorp/semgrep
RUN pip3 install semgrep

# ruleid: missing-user-entrypoint
USER non-root
ENTRYPOINT semgrep -f p/xss

# ruleid: missing-user-entrypoint
USER non-root
ENTRYPOINT ["semgrep", "--config", "localfile", "targets"]
