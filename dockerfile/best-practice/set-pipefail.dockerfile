# cf. https://github.com/hadolint/hadolint/wiki/DL4006

FROM debian:jesse

# ruleid: set-pipefail
RUN wget -O - https://some.site | wc -l > /number

# ruleid: set-pipefail
RUN apt-get update || apt-get install something || apt-get clean

# ok: set-pipefail
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN wget -O - https://some.site | wc -l > /number

# ok: set-pipefail
SHELL ["/bin/ash", "-o", "pipefail", "-c"]
RUN wget -O - https://some.site | wc -l > /number
