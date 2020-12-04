FROM python

# ruleid: missing-pip-no-cache-dir
RUN pip install MySQL_python

# ruleid: missing-pip-no-cache-dir
RUN pip install MySQL_python semgrep

# ok: missing-pip-no-cache-dir
RUN pip install --no-cache-dir MySQL_python

# ok: missing-pip-no-cache-dir
RUN pip install --no-cache-dir MySQL_python semgrep

FROM python:3.7

# ruleid: missing-pip-no-cache-dir
RUN pip3 install MySQL_python

# ruleid: missing-pip-no-cache-dir
RUN pip3 install MySQL_python semgrep

# ok: missing-pip-no-cache-dir
RUN pip3 install --no-cache-dir MySQL_python

# ok: missing-pip-no-cache-dir
RUN pip3 install --no-cache-dir MySQL_python semgrep
