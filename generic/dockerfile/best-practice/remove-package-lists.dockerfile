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
