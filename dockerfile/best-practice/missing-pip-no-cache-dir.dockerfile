FROM python

# ruleid: missing-pip-no-cache-dir
RUN pip install MySQL_python

# ruleid: missing-pip-no-cache-dir
RUN python -m pip install MySQL_python

# ruleid: missing-pip-no-cache-dir
RUN python3 -m pip install MySQL_python

# ruleid: missing-pip-no-cache-dir
RUN pip install MySQL_python semgrep

# ok: missing-pip-no-cache-dir
RUN pip install --no-cache-dir MySQL_python

# ok: missing-pip-no-cache-dir
RUN pip install --no-cache-dir MySQL_python semgrep

# ok: missing-pip-no-cache-dir
RUN pip install .

FROM python:3.7

# ruleid: missing-pip-no-cache-dir
RUN pip3 install MySQL_python

# ruleid: missing-pip-no-cache-dir
RUN pip2 install MySQL_python

# ruleid: missing-pip-no-cache-dir
RUN pip3 install MySQL_python semgrep

# ok: missing-pip-no-cache-dir
RUN pip3 install --no-cache-dir MySQL_python

# ok: missing-pip-no-cache-dir
RUN pip3 install --no-cache-dir MySQL_python semgrep

FROM python:3.7

# ENV SOMETHING=true PIP_NO_CACHE_DIR=true
ENV PIP_NO_CACHE_DIR=true

# ok: missing-pip-no-cache-dir
RUN pip install MySQL_python

FROM python:3.10.1-alpine3.15@sha256:dce56d40d885d2c8847aa2a278a29d50450c8e3d10f9d7ffeb2f38dcc1eb0ea4
LABEL maintainer="support@semgrep.com"
ENV PIP_DISABLE_PIP_VERSION_CHECK=true PIP_NO_CACHE_DIR=true

# ugly: circle CI requires valid git and ssh programs in the container
# when running semgrep on a repository containing submodules
RUN apk add --no-cache git openssh

COPY --from=build-semgrep-core \
     /semgrep/semgrep-core/_build/install/default/bin/semgrep-core /usr/local/bin/semgrep-core
RUN semgrep-core -version

COPY semgrep /semgrep
# hadolint ignore=DL3013
RUN SEMGREP_SKIP_BIN=true python -m pip install /semgrep && \
     semgrep --version && \
     mkdir -p /src && \
     chmod 777 /src && \
     mkdir -p /tmp/.cache && \
     chmod 777 /tmp/.cache
