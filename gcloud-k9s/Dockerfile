# syntax=docker/dockerfile:1

# https://console.cloud.google.com/artifacts/docker/google.com:cloudsdktool/us/gcr.io/google-cloud-cli
ARG GOOGLE_CLOUD_CLI_VERSION="517.0.0"

FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:${GOOGLE_CLOUD_CLI_VERSION}

ENV K9S_VERSION="0.40.10"

RUN cd /tmp \
  && curl -sLO "https://github.com/derailed/k9s/releases/download/v${K9S_VERSION}/k9s_Linux_amd64.tar.gz" \
  && tar xf k9s_Linux_amd64.tar.gz \
  && mv k9s /usr/local/bin \
  && rm -rf /tmp/*
