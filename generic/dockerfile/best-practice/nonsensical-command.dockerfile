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
