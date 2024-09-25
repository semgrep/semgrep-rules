FROM busybox

# uncomment for ok
#USER notroot

RUN git clone https://github.com/returntocorp/semgrep
RUN pip3 install semgrep

# ruleid: missing-user
CMD semgrep -f p/xss

# ruleid: missing-user
CMD semgrep --config localfile targets

# ruleid: missing-user
CMD ["semgrep", "--version"]
