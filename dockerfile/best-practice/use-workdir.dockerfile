FROM busybox

# ruleid: use-workdir
RUN cd semgrep && git clone https://github.com/returntocorp/semgrep

# ok: use-workdir
RUN pip3 install semgrep && cd ..

# ok: use-workdir
RUN semgrep -f p/xss

# ok: use-workdir
RUN blah

# ok: use-workdir
RUN blah blahcd
