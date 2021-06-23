FROM busybox

# ruleid: last-user-is-root
USER root
RUN git clone https://github.com/returntocorp/semgrep
RUN pip3 install semgrep
RUN semgrep -f p/xss



















FROM alpine
USER root
RUN apk install curl
CMD ["/hello"]
# ruleid: last-user-is-root
USER root
CMD ["ls -ltr"]




















FROM alpine
USER root
RUN apk install curl
CMD ["/hello"]
# ok: last-user-is-root
USER daemon
CMD ["ls -ltr"]




















FROM alpine
USER root
RUN apk install curl
USER daemon
CMD ["/hello"]
# ruleid: last-user-is-root
USER root
CMD ["ls -ltr"]
