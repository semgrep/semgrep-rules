FROM debian
# ruleid: missing-assume-yes-switch
RUN apt-get install semgrep=0.30.0

# ok: missing-assume-yes-switch
RUN apt-get install -y python=2.7 semgrep

# ok: missing-assume-yes-switch
RUN apt-get install --no-install-recommends -y python=2.7 semgrep

# ok: missing-assume-yes-switch
RUN apt-get install -y python=2.7

# ok: missing-assume-yes-switch
RUN apt-get install --yes python=2.7

#ok: missing-assume-yes-switch
RUN apt-get install -qqy

#ok: missing-assume-yes-switch
RUN apt-get install -yqq

# ok: missing-assume-yes-switch
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-setuptools \
    libpython3-dev \
    python3-dev \
    git \
    ca-certificates \
    zip \
    jq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# ruleid: missing-assume-yes-switch
RUN apt-get update \
    && apt-get install --no-install-recommends \
    python3 \
    python3-pip \
    python3-setuptools \
    libpython3-dev \
    python3-dev \
    git \
    ca-certificates \
    zip \
    jq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# ok: missing-assume-yes-switch
RUN apt-get update \
    && apt-get install --assume-yes --no-install-recommends \
    python3 \
    python3-pip \
    python3-setuptools \
    libpython3-dev \
    python3-dev \
    git \
    ca-certificates \
    zip \
    jq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
