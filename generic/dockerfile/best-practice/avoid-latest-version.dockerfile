# ruleid: avoid-latest-version
FROM debian:latest

# ruleid: avoid-latest-version
FROM myregistry.local/testing/test-image:latest

# ruleid: avoid-latest-version
FROM debian:latest as blah

# ruleid: avoid-latest-version
FROM myregistry.local/testing/test-image:latest as blah

# ok: avoid-latest-version
FROM debian:jessie

# ok: avoid-latest-version
FROM myregistry.local/testing/test-image:42ee222

# ok: avoid-latest-version
FROM debian:jessie as blah2

# ok: avoid-latest-version
FROM myregistry.local/testing/test-image:2a4af68 as blah2
