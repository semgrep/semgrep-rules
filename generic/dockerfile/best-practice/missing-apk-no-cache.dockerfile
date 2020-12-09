FROM alpine:3.7

# ruleid: missing-apk-no-cache
RUN apk update \
    && apk add foo=1.0 \
    && rm -rf /var/cache/apk/*

# ruleid: missing-apk-no-cache
RUN apk add --update foo=1.0
    && rm -rf /var/cache/apk/*

# ok: missing-apk-no-cache
RUN apk add --no-cache foo=1.0

# ok: missing-apk-no-cache
RUN apk add --no-cache --update foo=1.0

# ok: missing-apk-no-cache
RUN apk add --update --no-cache foo=1.0
