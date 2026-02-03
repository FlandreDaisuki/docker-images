# syntax=docker/dockerfile:1

# https://console.cloud.google.com/artifacts/docker/google.com:cloudsdktool/us/gcr.io/google-cloud-cli
ARG GOOGLE_CLOUD_CLI_VERSION="554.0.0-stable"

FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:${GOOGLE_CLOUD_CLI_VERSION}

# https://github.com/derailed/k9s/releases/
ENV K9S_VERSION="0.50.18"

WORKDIR /tmp

RUN apt-get update \
 && apt-get -y --no-install-recommends install \
    ca-certificates \
    curl \
    docker.io \
 && curl -sLO "https://github.com/derailed/k9s/releases/download/v${K9S_VERSION}/k9s_Linux_amd64.tar.gz" \
 && tar xf k9s_Linux_amd64.tar.gz \
 && mv k9s /usr/local/bin \
 && rm -rf /tmp/*
