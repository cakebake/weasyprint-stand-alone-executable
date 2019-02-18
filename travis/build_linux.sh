#!/bin/sh

apt-get update -qq && apt-get install -qq -y \
  build-essential \
  python3-dev \
  python3-pip \
  python3-setuptools \
  python3-wheel \
  python3-cffi \
  libcairo2 \
  libpango-1.0-0 \
  libpangocairo-1.0-0 \
  libgdk-pixbuf2.0-0 \
  libffi-dev \
  shared-mime-info \
  binutils \
  patchelf \
  libjpeg9-dev \
  libpng-dev

pip3 install --upgrade --no-cache-dir \
  'WeasyPrint==44' \
  'pyinstaller==3.4' \
  'staticx==0.6.0'

weasyprint --version
pyinstaller --version
staticx --version

cd /tmp

pyinstaller /usr/local/bin/weasyprint \
  --name weasyprint \
  --clean \
  --onefile \
  --add-data '/usr/local/lib/python3.7/dist-packages/pyphen/dictionaries:pyphen/dictionaries' \
  --add-data '/usr/local/lib/python3.7/dist-packages/weasyprint/css/html5_ph.css:css' \
  --add-data '/usr/local/lib/python3.7/dist-packages/weasyprint/css/html5_ua.css:css' \
  --add-data '/usr/local/lib/python3.7/dist-packages/weasyprint/VERSION:.' \
  --add-data '/usr/local/lib/python3.7/dist-packages/cairocffi/VERSION:cairocffi'

# temp patch staticx because of libjpeg not found
sed -i 's/# Some shared objs might have no DT_NEEDED tags (see issue #67)/print("ldd, unexpected lin in ldd output: " + line)\ncontinue/g' \
  /usr/local/lib/python3.7/dist-packages/staticx/elf.py

staticx /tmp/dist/weasyprint /workdir/dist/weasyprint
