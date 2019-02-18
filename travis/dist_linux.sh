#!/bin/sh

docker pull $DOCKER_IMAGE
docker run --rm \
  -v $PWD:/workdir \
  $DOCKER_IMAGE \
  /workdir/travis/build_linux.sh
