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

Local build_linux for testing
-----------------------------

```bash
docker run --rm \
  -v $PWD:/workdir \
  -e "FINAL_USER=$UID" \
  -e "FINAL_GROUP=$GID" \
  ubuntu:19.04 \
  /workdir/travis/build_linux.sh
```
