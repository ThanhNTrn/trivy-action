FROM python:latest
LABEL authors="franka.freyer"
COPY . /mw-converter-trivy

RUN python -m pip install pyyaml
RUN chmod +x /mw-converter-trivy/entrypoint.sh

ENTRYPOINT ["/mw-converter-trivy/entrypoint.sh"]