# cf. https://github.com/hadolint/hadolint/wiki/DL3029

# ruleid: avoid-platform-with-from
FROM --platform=x86 busybox

# ok: avoid-platform-with-from
FROM busybox
