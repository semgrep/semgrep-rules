FROM docker:latest

WORKDIR /app

VOLUME /var/run/docker.sock:/var/run/docker.sock

CMD ["docker", "images"]