#!/bin/sh

# generate executable
docker build --quiet \
  --file ./travis/linux/Dockerfile \
  --pull \
  --tag wpimg \
  --build-arg WEASYPRINT_VERSION=$WEASYPRINT_VERSION \
  --build-arg STATICX_VERSION=$STATICX_VERSION \
  --build-arg PYINSTALLER_VERSION=$PYINSTALLER_VERSION \
  .
docker run --rm \
  -e "HOST_OWNER_UID=$UID" \
  -e "HOST_OWNER_GID=$GID" \
  -v $PWD:/workdir \
  wpimg \
  /workdir/travis/linux/build.sh

# test executable
docker run --rm \
  -u $UID:$GID \
  -v $PWD:/workdir \
  ubuntu:16.04 \
  /workdir/travis/linux/test.sh
