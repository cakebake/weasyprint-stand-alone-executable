#!/bin/sh

docker pull $DOCKER_IMAGE
docker run --rm \
  -v $PWD:/workdir \
  -e "FINAL_USER=$UID" \
  -e "FINAL_GROUP=$GID" \
  $DOCKER_IMAGE \
  /workdir/travis/build_linux.sh
