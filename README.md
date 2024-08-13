<div align="center">

# Linux Containers (Dockerfiles)
### A repository of Dockerfiles to be built into container environments.
[![Docker Badge](https://img.shields.io/badge/Docker-1D63ED?logo=docker&logoColor=white)](https://docker.com)
[![Kali Badge](https://img.shields.io/badge/Kali_Linux-2777FF?logo=kalilinux&logoColor=white)](https://kali.org/)
[![Ubuntu Badge](https://img.shields.io/badge/Ubuntu-E95420?logo=ubuntu&logoColor=white)](https://ubuntu.com/desktop)
[![Fedora Badge](https://img.shields.io/badge/Fedora-51A2DA?logo=fedora&logoColor=white)](https://fedoraproject.org/)
[![openSUSE Badge](https://img.shields.io/badge/openSUSE-73BA25?logo=opensuse&logoColor=white)](https://www.opensuse.org/)
#

[![Intro Badge](https://img.shields.io/badge/Intro-151515)](#introduction) <sup> **•** </sup>
[![Intro Badge](https://img.shields.io/badge/Run_it-151515)](#how-to-run-it) <sup> **•** </sup>
[![Intro Badge](https://img.shields.io/badge/Use_it-151515)](#how-to-use-it) <sup> **•** </sup>
[![Intro Badge](https://img.shields.io/badge/Script_Breakdown-151515)](#script-breakdown)

</div>

### Introduction
This is a personal repository of Dockerfiles, made to quickly configure container environments, which are meant to be used interactively. It also demonstrates how to create & use Dockerfiles and the main docker commands, which are used in the shell script at the root directory.

Some Dockerfile configurations are altered locally before building the image, depending on what is necessary.

### How to Run it
Simply give execution permissions & run the shell script located at the root directory with the desired distros as argument.

The script will pull the latest official image of the given distros and build the environment automatically. It will also create a local shell script as a command to easily run the container. Instructions:

```sh
cd linux-containers

chmod +x $(pwd)/build-container.sh
$(pwd)/build-container.sh ubuntu

run-ubuntu
```

### How to Use it
The containers are to be used interactively, as a... _contained_ <sub>(heh)</sub> environment for development, as a pocket distro.

When entering a container, a local user with elevation privileges will be available. For privileged actions, it will be necessary to set a password after first accessing the environment. The root account is completely locked away and inaccessible.

After setting the password, use normally as one would with any distro.

<div align="center">
  <div>
    <img src="assets/images/Ubuntu.png" alt="Ubuntu container in terminal window" width="400"/>
    <img src="assets/images/Fedora.png" alt="Fedora container in terminal window" width="400"/>
  </div>
  
  <div>
    <img src="assets/images/Kali.png" alt="Kali container in terminal window" width="400"/>
    <img src="assets/images/openSUSE.png" alt="openSUSE container in terminal window" width="400"/>
  </div>
</div>

#
###### Script breakdown:
```sh
Available builds: kali ubuntu
Build container cmd ex.: ./build-container.sh ubuntu
Run container cmd ex.: run-ubuntu
____________________________________________________

## Make sure we have a clean slate, removes previously used containers  / images
docker container stop Ubuntu && docker container remove Ubuntu && docker image remove ubuntu-build
____________________________________________________

# Always pull latest base image
docker pull ubuntu &&\

## Build image from Dockerfile
docker build --force-rm --tag ubuntu-build "$(pwd)/ubuntu-dockerfile/" &&\

## Create a container from built image
docker create --name Ubuntu --interactive --tty --hostname coder --user ubuntu --volume "$HOME/.docker/Ubuntu:/home/shared" ubuntu-build &&\

## We can make either an alias or shell script to start the created container:
# echo 'alias run-ubuntu="docker start Ubuntu && docker attach Ubuntu"' >> "$HOME/.profile"
echo -e '#!/bin/sh\n'"docker start Ubuntu && docker attach Ubuntu" > "$HOME/.local/bin/run-ubuntu" && chmod +x "$HOME/.local/bin/run-ubuntu"
```
#

<div align="center">

[![Back to the Top Badge](https://custom-icon-badges.demolab.com/badge/Back_to_the_Top-151515?logo=chevron-up)](#linux-containers-dockerfiles)

</div>
