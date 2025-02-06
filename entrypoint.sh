#! /bin/bash
ARGS=("$@")

cp $1 .

ls -a
python /mw-converter-trivy/convert-mw-policy-to-trivy.py ${ARGS[*]}

#trivy=$(cat $2)
#echo "trivy-yaml=$trivy" >> $GITHUB_OUTPUT