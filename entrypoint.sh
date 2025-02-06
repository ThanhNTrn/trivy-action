#! /bin/bash
ARGS=("$@")

python /mw-converter-trivy/convert-mw-policy-to-trivy.py ${ARGS[*]}

ls

cat $2 > "$OUTPUT_FILE"
echo "trivy-yaml=$OUTPUT_FILE" >> $GITHUB_OUTPUT