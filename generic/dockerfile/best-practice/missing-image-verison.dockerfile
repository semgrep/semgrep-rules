# ruleid: missing-image-version
FROM debian

# ruleid: missing-image-version
FROM debian as blah

# ok: missing-image-version
FROM debian:jessie

# ok: missing-image-version
FORM debian:jessie as blah2
