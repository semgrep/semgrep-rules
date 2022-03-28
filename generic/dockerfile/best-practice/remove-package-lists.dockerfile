FROM busybox

# ruleid: remove-package-lists
RUN apt-get update && apt-get install --no-install-recommends -y python

# ok: remove-package-lists
RUN apt-get update && apt-get install --no-install-recommends -y python \
 && rm -rf /var/lib/apt/lists/*

# ruleid: remove-package-lists
 RUN apt-get update && apt-get install --no-install-recommends -y python \
 && apt-get clean

# ok: remove-package-lists
RUN apt-get update && apt-get install --no-install-recommends -y python \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# ok: remove-package-lists
RUN apt-get update && \
    apt-get install --no-install-recommends -y tini && \
    rm -rf /var/lib/apt/lists/*

# ok: remove-package-lists
RUN apt-get update && apt-get install -y \
    aufs-tools \
    automake \
    build-essential \
    curl \
    dpkg-sig \
    libcap-dev \
    libsqlite3-dev \
    mercurial \
    reprepro \
    ruby1.9.1 \
    ruby1.9.1-dev \
    s3cmd=1.1.* \
 && rm -rf /var/lib/apt/lists/*
