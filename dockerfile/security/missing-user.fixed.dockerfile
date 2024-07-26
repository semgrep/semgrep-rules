FROM busybox

# uncomment for ok
#USER notroot

RUN git clone https://github.com/returntocorp/semgrep
RUN pip3 install semgrep

# ok: missing-user
USER root

# NOTE: The CMD subdirective should not trigger a false positive
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD [ "curl" ]

CMD ["semgrep", "--version"]
