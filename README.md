# Linux Containers (Dockerfiles)
[![Docker Badge](https://img.shields.io/badge/Docker-1D63ED?logo=docker&logoColor=white)](https://docker.com)
[![Kali Badge](https://img.shields.io/badge/Kali_Linux-2777FF?logo=kalilinux&logoColor=white)](https://kali.org/)
[![Ubuntu Badge](https://img.shields.io/badge/Ubuntu-E95420?logo=ubuntu&logoColor=white)](https://ubuntu.com/desktop)

A repository of Dockerfiles to be built into container environments.

Some configurations are altered before building the image, depending on what is necessary.


##
###### Shell script step-by-step example:
```
Available builds: kali ubuntu
Build container cmd ex.: ./build-container.sh ubuntu
Run container cmd ex.: run-ubuntu
____________________________________________________

## Make sure we have a clean slate, removes previously used containers  / images
docker container rm Ubuntu && docker image rm ubuntu

## Build image from Dockerfile
docker build --force-rm --tag ubuntu "$(pwd)/ubuntu-dockerfile/"

## Create a container from built image
docker run --name Ubuntu --interactive --tty --detach --hostname coder --volume "$HOME/.docker/Ubuntu:/home/shared" ubuntu

## We can make either an alias or shell script to start the created container:
# echo 'alias run-ubuntu="docker start Ubuntu && docker attach Ubuntu"' >> "$HOME/.profile"
echo -e '#!/bin/sh\n'"docker start Ubuntu && docker attach Ubuntu" > "$HOME/.local/bin/run-ubuntu" && chmod +x "$HOME/.local/bin/run-ubuntu"
```
