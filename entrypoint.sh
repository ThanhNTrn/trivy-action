#! /bin/bash
ARGS=("$@")

python /mw-converter-trivy/convert-mw-policy-to-trivy.py ${ARGS[*]}

ls

touch $2
ls

cat $2
#echo "trivy-yaml=$OUTPUT_FILE" >> $GITHUB_OUTPUT