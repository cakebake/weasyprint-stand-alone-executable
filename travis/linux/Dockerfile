FROM ubuntu:19.04

ARG WEASYPRINT_VERSION
ARG STATICX_VERSION
ARG PYINSTALLER_VERSION

RUN apt-get update -qq && apt-get install -qq -y \
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
  scons \
  libjpeg9-dev \
  libpng-dev \
  vim

RUN pip3 install --upgrade --no-cache-dir \
    "WeasyPrint==$WEASYPRINT_VERSION" \
    "staticx==$STATICX_VERSION" \
    "PyInstaller==$PYINSTALLER_VERSION"

CMD ["/bin/bash"]
