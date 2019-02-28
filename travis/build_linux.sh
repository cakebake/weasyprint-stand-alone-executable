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
  'WeasyPrint==45' \
  'staticx==0.6.0' \
  'pyinstaller==3.4'

weasyprint --version
staticx --version
pyinstaller --version

cd /tmp

pyinstaller /usr/local/bin/weasyprint \
  --name weasyprint-stand-alone-executable \
  --clean \
  --onedir \
  --add-data '/usr/local/lib/python3.7/dist-packages/pyphen/dictionaries:pyphen/dictionaries' \
  --add-data '/usr/local/lib/python3.7/dist-packages/weasyprint/css/html5_ph.css:css' \
  --add-data '/usr/local/lib/python3.7/dist-packages/weasyprint/css/html5_ua.css:css' \
  --add-binary '/lib/x86_64-linux-gnu/libcairo.so.2.11600.0:.' \
  --add-binary '/lib/x86_64-linux-gnu/libpango-1.0.so.0.4200.3:.' \
  --add-binary '/lib/x86_64-linux-gnu/libpangocairo-1.0.so.0.4200.3:.' \
  --add-binary '/lib/x86_64-linux-gnu/libpangoft2-1.0.so.0.4200.3:.'

staticx --loglevel DEBUG \
  /tmp/dist/weasyprint-stand-alone-executable/weasyprint-stand-alone-executable \
  /workdir/dist/weasyprint
