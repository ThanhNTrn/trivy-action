#! /bin/bash
ARGS=("$@")
pwd
ls -a
python /mw-converter-trivy/convert-mw-policy-to-trivy.py ${ARGS[*]}