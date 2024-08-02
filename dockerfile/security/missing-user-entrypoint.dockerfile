FROM busybox

# uncomment for ok
#USER notroot

RUN git clone https://github.com/returntocorp/semgrep
RUN pip3 install semgrep

# ruleid: missing-user-entrypoint
ENTRYPOINT semgrep -f p/xss

# TODO: metavar ellipses bug, this should be a finding but is a false negative
# ruleid: missing-user-entrypoint
ENTRYPOINT ["semgrep", "--config", "localfile", "targets"]
