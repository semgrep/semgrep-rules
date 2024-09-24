FROM busybox

# uncomment for ok
#USER notroot

RUN git clone https://github.com/returntocorp/semgrep
RUN pip3 install semgrep

# ruleid: missing-user
CMD semgrep --config localfile targets

# TODO: metavar ellipses bug, this should be a failure but is a false negative
# ruleid: missing-user
CMD ["semgrep", "--version"]
