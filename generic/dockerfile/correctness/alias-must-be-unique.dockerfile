# cf. https://github.com/hadolint/hadolint/wiki/DL3024

# ruleid: alias-must-be-unique
FROM debian:jesse as build

RUN stuff

FROM debian:jesse as build

RUN more_stuff

# ok: alias-must-be-unique
FROM debian:jesse as another-alias

RUN more_more_stuff
