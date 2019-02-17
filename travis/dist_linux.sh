#!/bin/sh

echo "dist linux"

whoami

hostname

docker pull $DOCKER_IMAGE
mkdir -p dist
docker run -e TRAVIS_PYTHON_VERSION --rm \
  -v `pwd`:/io \
  $DOCKER_IMAGE \
  $PRE_CMD \
  /io/travis/build_linux.sh
