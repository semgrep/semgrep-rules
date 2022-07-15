# cf. https://github.com/hadolint/hadolint/wiki/DL3027

FROM busybox

# ruleid: prefer-apt-get
RUN apt install curl=1.1.0

# ok: prefer-apt-get
RUN apt-get install curl=1.1.0
