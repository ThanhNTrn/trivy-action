#! /bin/bash
ARGS=("$@")

python /mw-converter-trivy/convert-mw-policy-to-trivy.py "${ARGS[*]}"

OUTPUT_FILE="./trivy.yaml"
echo "trivy-yaml=$OUTPUT_FILE" >> "$GITHUB_OUTPUT"