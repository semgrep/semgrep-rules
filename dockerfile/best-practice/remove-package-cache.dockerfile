FROM busybox

# ruleid: remove-package-cache
RUN apt-get update && apt-get install --no-install-recommends -y python

# ruleid: remove-package-cache
RUN apt-get update && apt-get install --no-install-recommends -y python \
 && rm -rf /var/lib/apt/lists/*

# ok: remove-package-cache
 RUN apt-get update && apt-get install --no-install-recommends -y python \
 && apt-get clean

# ok: remove-package-cache
RUN apt-get update && apt-get install --no-install-recommends -y python \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# ruleid: remove-package-cache
RUN apt-get update && apt-get install --no-install-recommends -y python \
 && rm -rf /var/lib/apt/lists/* && apt-get install -no-install-recommends -y semgrep

# ok: remove-package-cache
RUN apt-get update &&\
    apt-get install --no-install-recommends -y \
      build-essential \
      libxml2-dev \
      libxmlsec1-dev \
      libxmlsec1-openssl \
      libyaml-dev \
      pkg-config &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*
