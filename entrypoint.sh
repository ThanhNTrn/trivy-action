#! /bin/bash
ARGS=("$@")

python /mw-converter-trivy/convert-mw-policy-to-trivy.py ${ARGS[*]}

cat "trivy-yaml=$2" >> $GITHUB_OUTPUT