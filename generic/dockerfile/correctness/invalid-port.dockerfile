FROM busybox

# ok: invalid-port
EXPOSE 65535

# ruleid: invalid-port
EXPOSE 65536

# ok: invalid-port
EXPOSE 0

# ruleid: invalid-port
EXPOSE -1
