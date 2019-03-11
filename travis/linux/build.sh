#!/bin/sh

weasyprint --version
staticx --version
pyinstaller --version

# TEMP FIX :: patch weasyprint because of ssl error in final executable
sed -i -e 's/import sys/import sys\nimport ssl\nssl._create_default_https_context = ssl._create_unverified_context\n/g' /usr/local/bin/weasyprint

cd /tmp

pyinstaller /usr/local/bin/weasyprint \
  --name wsae-onefile \
  --clean \
  --onefile \
  --add-data '/usr/local/lib/python3.7/dist-packages/pyphen/dictionaries:pyphen/dictionaries' \
  --add-data '/usr/local/lib/python3.7/dist-packages/weasyprint/css/html5_ph.css:css' \
  --add-data '/usr/local/lib/python3.7/dist-packages/weasyprint/css/html5_ua.css:css' \
  --add-data '/usr/local/lib/python3.7/dist-packages/weasyprint/VERSION:.' \
  --add-data '/usr/local/lib/python3.7/dist-packages/cairocffi/VERSION:cairocffi' \
  --add-data '/usr/local/lib/python3.7/dist-packages/tinycss2/VERSION:tinycss2' \
  --add-binary '/lib/x86_64-linux-gnu/libcairo.so.2:.' \
  --add-binary '/lib/x86_64-linux-gnu/libpango-1.0.so.0:.' \
  --add-binary '/lib/x86_64-linux-gnu/libpangocairo-1.0.so.0:.' \
  --add-binary '/lib/x86_64-linux-gnu/libpangoft2-1.0.so.0:.'

stat /tmp/dist/wsae-onefile
cat /tmp/build/wsae-onefile/warn-wsae-onefile.txt
/tmp/dist/wsae-onefile --version
du -h /tmp/dist/wsae-onefile

staticx --loglevel INFO \
  /tmp/dist/wsae-onefile \
  /workdir/dist/weasyprint

chown $HOST_OWNER_UID:$HOST_OWNER_GID /workdir/dist/weasyprint

stat /workdir/dist/weasyprint
du -h /workdir/dist/weasyprint
