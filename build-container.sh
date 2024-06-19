#!/bin/bash
echo 'Available builds: kali ubuntu'
echo 'Build container cmd ex.: ./build-container.sh kali'
echo 'Run container cmd ex.: run-kali'
echo '__________________________________________________'

mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.docker"

for IMAGE in $@; do
  
  if [ $IMAGE == 'kali' ]; then
    CONTAINER_NAME='Kali'
    BUILD_OPTS='--no-cache --force-rm'
    RUN_OPTS='--network host --hostname tester'
  fi
  
  if [ $IMAGE == 'ubuntu' ]; then
    CONTAINER_NAME='Ubuntu'
    BUILD_OPTS='--force-rm'
    RUN_OPTS='--hostname coder'
  fi
  
  mkdir -p "$HOME/.docker/$CONTAINER_NAME"
  docker container rm $CONTAINER_NAME && docker image rm $IMAGE
  docker build $BUILD_OPTS --tag $IMAGE "$(pwd)/$IMAGE-dockerfile/"
  docker run --name $CONTAINER_NAME --interactive --tty --detach $RUN_OPTS --volume "$HOME/.docker/$CONTAINER_NAME:/home/shared" $IMAGE
  echo -e '#!/bin/sh\n'"docker start $CONTAINER_NAME && docker attach $CONTAINER_NAME" > "$HOME/.local/bin/run-$IMAGE" && chmod +x "$HOME/.local/bin/run-$IMAGE"
  
done
