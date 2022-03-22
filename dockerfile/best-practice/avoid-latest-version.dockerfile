# ruleid: avoid-latest-version
FROM debian:latest

# ruleid: avoid-latest-version
FROM debian:latest as blah

# ok: avoid-latest-version
FROM debian:jessie

# ok: avoid-latest-version
FORM debian:jessie as blah2
