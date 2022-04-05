# cf. https://github.com/hadolint/hadolint/wiki/DL3025

FROM busybox
# ruleid:  prefer-json-notation
ENTRYPOINT s3cmd
# ruleid:  prefer-json-notation
ENTRYPOINT command param1 param2
# ruleid: prefer-json-notation
CMD command
# ruleid: prefer-json-notation
CMD my-service server

# ok: prefer-json-notation
ENTRYPOINT ["s3cmd"]
# ok: prefer-json-notation
ENTRYPOINT ["command", "param1", "param2"]
# ok: prefer-json-notation
CMD ["my-service", "server"]
# ok: prefer-json-notation
CMD ["command"]
