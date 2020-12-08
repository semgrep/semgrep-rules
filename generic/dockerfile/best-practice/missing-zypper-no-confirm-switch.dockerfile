# cf. https://github.com/hadolint/hadolint/wiki/DL3034

FROM debian
# ruleid: missing-zypper-no-confirm-switch
RUN zypper install httpd=2.4.46 && zypper clean

# ok: missing-zypper-no-confirm-switch
RUN zypper install -y httpd=2.4.46 && zypper clean
