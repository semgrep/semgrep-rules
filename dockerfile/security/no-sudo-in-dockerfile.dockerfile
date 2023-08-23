# Use an official Ubuntu 20.04 as base image
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

# ok: no-sudo-in-dockerfile
RUN apt-get update && apt-get upgrade -y

# ok: no-sudo-in-dockerfile
RUN apt-get install -y sudo

RUN useradd -ms /bin/bash newuser

RUN echo "newuser ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

USER newuser

# ruleid: no-sudo-in-dockerfile
RUN sudo apt-get install -y curl

CMD ["echo", "Hello, Docker!"]
