# cf. https://github.com/hadolint/hadolint/wiki/DL3036

FROM opensuse/leap:15.2
# ruleid: missing-zypper-clean
RUN zypper install -y httpd=2.4.46
# ok: missing-zypper-clean
RUN zypper install -y httpd=2.4.46 && zypper clean
# ok: missing-zypper-clean
RUN zypper install -y httpd=2.4.46 && \
  zypper clean
