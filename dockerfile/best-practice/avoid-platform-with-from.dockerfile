# cf. https://github.com/hadolint/hadolint/wiki/DL3029

# ruleid: avoid-platform-with-from
FROM --platform=x86 busybox

# ruleid: avoid-platform-with-from
FROM --platform=x86 busybox:1.34

# ruleid: avoid-platform-with-from
FROM --platform=x86 busybox AS bb

# ruleid: avoid-platform-with-from
FROM --platform=x86 busybox:1.34 AS bb

# ok: avoid-platform-with-from
FROM busybox

# ok: avoid-platform-with-from
FROM busybox:1.34

# ok: avoid-platform-with-from
FROM busybox AS bb

# ok: avoid-platform-with-from
FROM busybox:1.34 AS bb
