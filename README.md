WIP: weasyprint-stand-alone-executable
======================================

[![Build Status](https://travis-ci.org/cakebake/weasyprint-stand-alone-executable.svg?branch=master)](https://travis-ci.org/cakebake/weasyprint-stand-alone-executable)

Stand Alone Executable from WeasyPrint - **work in progress**.

Todo
----

-	[ ] Build linux executable with Travis CI
-	[ ] Build macos executable with Travis CI
-	[ ] Build windows executable with App Veyor
-	...

Local linux build for testing
-----------------------------

```bash
docker build \
  --pull \
  --file ./travis/linux/Dockerfile \
  --tag wpimg \
  --build-arg WEASYPRINT_VERSION=45 \
  --build-arg STATICX_VERSION=0.7.0 \
  --build-arg PYINSTALLER_VERSION=3.4 \
  .
```

```bash
docker run --rm \
  -e "HOST_OWNER_UID=$UID" \
  -e "HOST_OWNER_GID=$GID" \
  -v $PWD:/workdir \
  wpimg \
  /workdir/travis/linux/build.sh
```

```bash
./dist/weasyprint https://weasyprint.org/ dist/weasyprint.pdf
```
