#!/bin/sh

# generate executable
docker run --rm \
  -v $PWD:/workdir \
  ubuntu:19.04 \
  /workdir/travis/build_linux.sh

# test executable
docker run --rm \
  -v $PWD:/workdir \
  ubuntu:16.04 \
  /workdir/travis/test_linux.sh
