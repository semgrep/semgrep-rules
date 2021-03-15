M busybox


RUN git clone https://github.com/returntocorp/semgrep
RUN pip3 install semgrep
# ruleid: missing-user
CMD semgrep -f p/xss



















FROM alpine
USER root
RUN apk install curl
USER root
# ok: missing-user
CMD ["ls -ltr"]




















FROM alpine
USER root
RUN apk install curl
USER daemon
# ok: missing-user
CMD ["ls -ltr"]




















FROM alpine
USER root
RUN apk install curl
USER daemon
USER root
# ok: missing-user
CMD ["ls -ltr"]
