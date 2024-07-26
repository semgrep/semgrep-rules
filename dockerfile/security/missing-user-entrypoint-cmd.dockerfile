FROM busybox

# Leave this hear to test that the missing-user rule doesn't think that commented out lines satisfy the rule
#USER notroot

RUN git clone https://github.com/returntocorp/semgrep
RUN pip3 install semgrep

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD [ "curl" ]

# ruleid: missing-user
ENTRYPOINT semgrep -f p/xss
CMD "--oss-only"