FROM busybox
# ruleid: use-absolute-workdir
WORKDIR usr/src/app
# ok: use-absolute-workdir
WORKDIR /usr/src/app
ENV foo /bar
# ok: use-absolute-workdir
WORKDIR ${foo}   # WORKDIR /bar
