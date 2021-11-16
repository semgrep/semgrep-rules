# cf. https://github.com/hadolint/hadolint/wiki/DL4003

FROM busybox
# ruleid: multiple-cmd-instructions
CMD /bin/true
CMD /bin/false















FROM busybox AS stage1
# ok: multiple-cmd-instructions
CMD /bin/true
FROM stage1 AS stage2
# ok: multiple-cmd-instructions
CMD /bin/false
