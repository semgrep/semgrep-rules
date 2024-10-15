FROM busybox

# uncomment for ok
#USER notroot

RUN git clone https://github.com/returntocorp/semgrep
RUN pip3 install semgrep

# ruleid: missing-user-entrypoint
ENTRYPOINT semgrep -f p/xss

# ruleid: missing-user-entrypoint
ENTRYPOINT ["semgrep", "--config", "localfile", "targets"]
