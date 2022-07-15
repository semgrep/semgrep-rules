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

# ok: missing-image-version
FROM python:3.10.1-alpine3.15@sha256:4be65b406f7402b5c4fd5df7173d2fd7ea3fdaa74d9c43b6ebd896197a45c448

# ok: missing-image-version
FROM python@sha256:4be65b406f7402b5c4fd5df7173d2fd7ea3fdaa74d9c43b6ebd896197a45c448

# ok: missing-image-version
FROM python:3.10.1-alpine3.15@sha256:4be65b406f7402b5c4fd5df7173d2fd7ea3fdaa74d9c43b6ebd896197a45c448 as name

# ok: missing-image-version
FROM python@sha256:4be65b406f7402b5c4fd5df7173d2fd7ea3fdaa74d9c43b6ebd896197a45c448 AS name

# ok: missing-image-version
FROM --platform=linux/amd64 python:3.10.1-alpine3.15@sha256:4be65b406f7402b5c4fd5df7173d2fd7ea3fdaa74d9c43b6ebd896197a45c448 as name

# ok: missing-image-version
FROM --platform=linux/amd64 python@sha256:4be65b406f7402b5c4fd5df7173d2fd7ea3fdaa74d9c43b6ebd896197a45c448 AS name

# ok: missing-image-version
FROM scratch
