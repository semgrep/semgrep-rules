# cf. https://github.com/hadolint/hadolint/wiki/DL3035

FROM opensuse/leap:15.2

# ruleid: avoid-zypper-update
RUN zypper update -y

# ruleid: avoid-zypper-update
RUN zypper update -y && zypper install -y httpd\>=2.4 && zypper clean

# ok: avoid-zypper-update
RUN zypper install -y httpd\>=2.4 && zypper clean

# ok: avoid-zypper-update
RUN zypper patch --cve=cve-2015-7547 && zypper clean
