FROM docker:latest

WORKDIR /app

# ruleid: dockerfile-dockerd-socket-mount
VOLUME /var/run/docker.sock:/var/run/docker.sock

# ok: dockerfile-dockerd-socket-mount
VOLUME ./app/main.py:/main.py

CMD ["docker", "images"]
