FROM busybox

# uncomment for ok
#USER notroot

RUN git clone https://github.com/returntocorp/semgrep
RUN pip3 install semgrep

# ruleid: missing-user-entrypoint
USER non-root
ENTRYPOINT semgrep -f p/xss

# TODO: metavar bug
# ok: missing-user-entrypoint
ENTRYPOINT ["semgrep", "--config", "localfile", "targets"]
