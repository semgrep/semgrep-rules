FROM python:3.10.1-alpine3.15@sha256:4be65b406f7402b5c4fd5df7173d2fd7ea3fdaa74d9c43b6ebd896197a45c448

# ruleid: dockerfile-pip-extra-index-url
RUN pip install model_lstm==${API_MODEL_LSTM_VERSION} \
    --index-url https://${FURY_TOKEN}@pypi.fury.io/${FURY_USERNAME}/ \
    --extra-index-url https://pypi.org/simple/


# ruleid: dockerfile-pip-extra-index-url
RUN --mount=type=secret,id=pip_index_url \
    pip install --extra-index-url "$(cat /run/secrets/pip_index_url)" -r full_requirements.txt --no-cache-dir


# ruleid: dockerfile-pip-extra-index-url
RUN --mount=type=secret,id=netrc,target=/root/.netrc pip3 install --no-cache-dir \
                 --extra-index-url https://artifactory.algol60.net/artifactory/csm-python-modules/simple \
                 --trusted-host artifactory.algol60.net -r requirements.txt
