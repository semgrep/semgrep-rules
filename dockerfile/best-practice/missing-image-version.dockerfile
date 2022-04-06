# ruleid: missing-image-version
FROM debian

# ruleid: missing-image-version
FROM nixos/nix

# ruleid: missing-image-version
FROM debian AS blah

# ruleid: missing-image-version
FROM nixos/nix AS build

# ruleid: missing-image-version
FROM --platform=linux/amd64 debian

# ruleid: missing-image-version
FROM --platform=linux/amd64 debian as name


# ok: missing-image-version
FROM debian:jessie

# ok: missing-image-version
FROM nixos/nix:2.7.0

# ok: missing-image-version
FROM debian:jessie AS blah

# ok: missing-image-version
FROM nixos/nix:2.7.0 AS build

# ok: missing-image-version
FROM --platform=linux/amd64 debian:jessie

# ok: missing-image-version
FROM --platform=linux/amd64 debian:jessie as name
