FROM debian

# ok: avoid-apt-get-upgrade
RUN apt-get update

# ruleid:avoid-apt-get-upgrade
RUN apt-get update && apt-get upgrade

# ruleid:avoid-apt-get-upgrade
RUN apt-get update && apt-get upgrade -y

# ruleid:avoid-apt-get-upgrade
RUN apt-get update && apt-get dist-upgrade

# ruleid:avoid-apt-get-upgrade
RUN apt-get upgrade
