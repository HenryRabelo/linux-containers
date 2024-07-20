#!/bin/bash
echo 'Available builds: kali ubuntu fedora opensuse'
echo 'Build container cmd ex.: ./build-container.sh kali'
echo 'Run container cmd ex.: run-kali'
echo '__________________________________________________'

mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.docker"

for DISTRO in $@; do
  
  if [ $DISTRO == 'kali' ]; then
    IMAGE='kalilinux/kali-rolling'
    CONTAINER='Kali'
    BUILD_OPTS='--no-cache --force-rm'
    RUN_OPTS="--network host --hostname tester --user $DISTRO"
  
  elif [ $DISTRO == 'ubuntu' ]; then
    IMAGE="$DISTRO"
    CONTAINER='Ubuntu'
    BUILD_OPTS='--force-rm'
    RUN_OPTS="--hostname coder --user $DISTRO"
  
  elif [ $DISTRO == 'fedora' ]; then
    IMAGE="$DISTRO"
    CONTAINER='Fedora'
    BUILD_OPTS='--force-rm'
    RUN_OPTS="--hostname coder --user $DISTRO"
  
  elif [ $DISTRO == 'opensuse' ]; then
    IMAGE='opensuse/tumbleweed'
    CONTAINER='openSUSE'
    BUILD_OPTS='--force-rm'
    RUN_OPTS="--hostname coder --user $DISTRO"
  
  else
    exit 1
  fi
  
  mkdir -p "$HOME/.docker/$CONTAINER"
  docker container stop $CONTAINER && docker container remove $CONTAINER && docker image remove $DISTRO-build
  echo '__________________________________________________'
  
  docker pull $IMAGE &&\
  docker build $BUILD_OPTS --tag $DISTRO-build "$(pwd)/$DISTRO-dockerfile/" &&\
  docker create --name $CONTAINER --interactive --tty $RUN_OPTS --volume "$HOME/.docker/$CONTAINER:/home/shared" $DISTRO-build &&\
  echo -e '#!/bin/sh\n'"docker start $CONTAINER && docker attach $CONTAINER" > "$HOME/.local/bin/run-$DISTRO" && chmod +x "$HOME/.local/bin/run-$DISTRO"
  
done
