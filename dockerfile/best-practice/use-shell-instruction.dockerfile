# cf. https://github.com/hadolint/hadolint/wiki/DL4005

FROM busybox

# Install bash
RUN apk add --update-cache bash=4.3.42-r3

# Use bash as the default shell
# ruleid: use-shell-instruction
RUN ln -sfv /bin/bash /bin/sh

# ruleid: use-shell-instruction
RUN ln -sfv /bin/zsh /bin/sh

# ok: use-shell-instruction
SHELL ["/bin/bash", "-c"]
