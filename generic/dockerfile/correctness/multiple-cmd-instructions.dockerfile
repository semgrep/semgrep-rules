# cf. https://github.com/hadolint/hadolint/wiki/DL4003

FROM busybox
# ruleid: multiple-cmd-instructions
CMD /bin/true
CMD /bin/false
