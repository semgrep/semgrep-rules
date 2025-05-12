FROM busybox

# uncomment for ok
#USER notroot

RUN git clone https://github.com/returntocorp/semgrep
RUN pip3 install semgrep

# ruleid: missing-user
USER non-root
CMD semgrep -f p/xss

# ruleid: missing-user
USER non-root
CMD semgrep --config localfile targets

# ruleid: missing-user
USER non-root
CMD ["semgrep", "--version"]

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -sSfI --retry 0 --tcp-nodelay http://localhost:18253/actuator/health/liveness || exit 1