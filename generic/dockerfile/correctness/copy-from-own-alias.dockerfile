# cf. https://github.com/hadolint/hadolint/wiki/DL3023

# ruleid: copy-from-own-alias
FROM debian:jesse as build

RUN stuff

COPY --from=build some stuff ./

# ok: copy-from-own-alias
FROM debian:jesse AS other

COPY some stuff ./
