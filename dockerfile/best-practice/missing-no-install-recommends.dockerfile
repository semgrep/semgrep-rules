FROM debian
# ruleid: missing-no-install-recommends
RUN apt-get install semgrep=0.30.0

# ruleid: missing-no-install-recommends
RUN apt-get install -y python=2.7 semgrep

# ok: missing-no-install-recommends
RUN apt-get install semgrep --no-install-recommends

# ok: missing-no-install-recommends
RUN apt-get install semgrep --no-install-recommends -y

# ok: missing-no-install-recommends
RUN apt-get install --no-install-recommends semgrep

# ok: missing-no-install-recommends
RUN apt-get install --no-install-recommends -y python=2.7 semgrep

# ok: missing-no-install-recommends
RUN apt-get install -y --no-install-recommends python=2.7

# ok: missing-no-install-recommends
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

# ruleid: missing-no-install-recommends
RUN apt-get update \
    && apt-get install \
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

# ruleid: missing-no-install-recommends
RUN apt-get update \
    && apt-get install --assume-yes \
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
