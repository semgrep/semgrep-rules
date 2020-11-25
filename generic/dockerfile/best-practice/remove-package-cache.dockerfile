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
