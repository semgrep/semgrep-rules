FROM alpine:3.7

RUN apk update \
# ruleid: avoid-apk-upgrade
    && apk upgrade \
    && apk add foo=1.0 \
    && rm -rf /var/cache/apk/*

# ok: avoid-apk-upgrade
RUN apk --no-cache add foo=1.0
