#!/bin/bash
echo 'Build container cmd: ./build-container.sh kali'
echo 'Run container cmd: run-kali'

mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.docker"

for distro in $@; do

  if [ $distro == 'kali' ]; then
    mkdir -p "$HOME/.docker/Kali"
    ## Make sure we have a clean slate
    docker container rm Kali && docker image rm kali
    ## Build image from Dockerfile
    docker build --no-cache --force-rm --tag kali "$(pwd)/kali-dockerfile/"
    ## Create a container from built image
    docker run --name Kali --interactive --tty --detach --network host --hostname tester --volume "$HOME/.docker/Kali:/home/shared" kali
    ## Make alias / shell script to start created container:
    # echo 'alias run-kali="docker start Kali && docker attach Kali"' >> "$HOME/.profile"
    echo -e '#!/bin/sh\ndocker start Kali && docker attach Kali' > "$HOME/.local/bin/run-kali" && chmod +x "$HOME/.local/bin/run-kali"
  fi
  
done
