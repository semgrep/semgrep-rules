FROM alpine

# ok: run-security-insecure
RUN true

# ok: run-security-insecure
RUN --security=sandbox true

# ok: run-security-insecure
RUN echo --security=insecure

# ruleid: run-security-insecure
RUN --security=insecure cat /proc/self/status

# ruleid: run-security-insecure
RUN --security=insecure ["cat", "/proc/self/status"]

# ruleid: run-security-insecure
RUN --mount=type=cache,target=/root/.cache --security=insecure make build

# ruleid: run-security-insecure
RUN --network=none --security=insecure make build

# ruleid: run-security-insecure
RUN --mount=type=cache,target=/root/.cache \
    --security=insecure \
    make build
