FROM busybox

# ruleid: nonsensical-command
RUN top

# ruleid: nonsensical-command
RUN kill 1234

# ruleid: nonsensical-command
RUN ifconfig

# ruleid: nonsensical-command
RUN ps -ef

# ruleid: nonsensical-command
RUN vim /var/log/www/error.log

# ok: nonsensical-command
RUN git clone https://github.com/returntocorp/semgrep

# ok: nonsensical-command
RUN pip3 install semgrep

# ok: nonsensical-command
RUN semgrep -f p/xss

# Commands that only share a prefix with a nonsensical command must not match.
# ok: nonsensical-command
RUN psql -c "SELECT 1"

# ok: nonsensical-command
RUN topgrade --dry-run

# ok: nonsensical-command
RUN mountpoint /data

# ok: nonsensical-command
RUN freebsd-version
