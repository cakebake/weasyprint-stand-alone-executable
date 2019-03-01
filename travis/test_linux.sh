#!/bin/sh

/workdir/dist/weasyprint --version
/workdir/dist/weasyprint https://weasyprint.org/ /tmp/weasyprint.pdf
stat /tmp/weasyprint.pdf
