# NOTE: need to change filename to something like
# multiple-cmd-instructions.ok.dockerfile when
# support for OK tests in files are added

FROM busybox AS stage1
# ok: multiple-cmd-instructions
CMD /bin/true
FROM stage1 AS stage2
# ok: multiple-cmd-instructions
CMD /bin/false
FROM stage2 AS stage3
# ok: multiple-cmd-instructions
HEALTHCHECK CMD /bin/true
CMD /bin/false
