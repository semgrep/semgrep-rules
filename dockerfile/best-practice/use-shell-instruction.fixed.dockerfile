# cf. https://github.com/hadolint/hadolint/wiki/DL4005

FROM busybox

# Install bash
RUN apk add --update-cache bash=4.3.42-r3

# Use bash as the default shell
# ruleid: use-shell-instruction
SHELL ["/bin/bash", "-c"]

# ruleid: use-shell-instruction
SHELL ["/bin/zsh", "-c"]

# ok: use-shell-instruction
SHELL ["/bin/bash", "-c"]
