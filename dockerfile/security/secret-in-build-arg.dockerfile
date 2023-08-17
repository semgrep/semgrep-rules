# ok: secret-in-build-arg
ARG BASE_IMG=rust
# ok: secret-in-build-arg
ARG BASE_TAG=latest

FROM ${BASE_IMG}:${BASE_TAG}

# ok: secret-in-build-arg
ARG environment

# ok: secret-in-build-arg
ARG BUILD_PACKAGES="ruby-dev build-base curl-dev git openssl bash"

# ok: secret-in-build-arg
ARG DEV_PACKAGES="postgresql-dev"

# ok: secret-in-build-arg
ARG RUBY_PACKAGES="tzdata"

# ok: secret-in-build-arg
ARG NAME_IS_OK="secret password token key"

# ruleid: secret-in-build-arg
ARG SECRET_KEY_BASE

# ruleid: secret-in-build-arg
ARG SECRET_TOKEN

# ruleid: secret-in-build-arg
ARG AUTH_TOKEN="this-is-a-secret"

# ruleid: secret-in-build-arg
ARG SSH_PRIVATE_KEY

# ruleid: secret-in-build-arg
ARG CERT_PASSWORD

# ruleid: secret-in-build-arg
ARG DJANGO_SECRET_KEY

# ruleid: secret-in-build-arg
ARG NEXUS_PASSWORD

# ruleid: secret-in-build-arg
ARG nexus_password
