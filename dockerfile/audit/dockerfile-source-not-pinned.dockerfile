# ruleid: dockerfile-source-not-pinned
FROM ocaml/opam2:debian-stable

# ok: dockerfile-source-not-pinned
# The docker base image below in the FROM currently uses OCaml 4.12.0

# ruleid: dockerfile-source-not-pinned
FROM returntocorp/ocaml:alpine-2021-07-15 as build-semgrep-core

# ruleid: dockerfile-source-not-pinned
FROM python:3.10.1-alpine3.15

# ruleid: dockerfile-source-not-pinned
FROM python:3.10.1-alpine3.15@v1

# ruleid: dockerfile-source-not-pinned
FROM python:3.10.1-alpine3.15@sha256

# ok: dockerfile-source-not-pinned
FROM python:3.10.1-alpine3.15@sha256:4be65b406f7402b5c4fd5df7173d2fd7ea3fdaa74d9c43b6ebd896197a45c448
