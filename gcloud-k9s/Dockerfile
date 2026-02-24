# syntax=docker/dockerfile:1

# https://console.cloud.google.com/artifacts/docker/google.com:cloudsdktool/us/gcr.io/google-cloud-cli
ARG GOOGLE_CLOUD_CLI_VERSION="557.0.0-stable"

FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:${GOOGLE_CLOUD_CLI_VERSION}

ARG TARGETOS
ARG TARGETARCH

# https://github.com/derailed/k9s/releases/
ENV K9S_VERSION="0.50.18"

WORKDIR /tmp

RUN apt-get update \
 && apt-get -y --no-install-recommends install \
    apt-transport-https \
    ca-certificates \
    curl \
    docker.io \
    gnupg \
 && curl -sLO "https://github.com/derailed/k9s/releases/download/v${K9S_VERSION}/k9s_Linux_${TARGETARCH}.tar.gz" \
 && tar xf "k9s_Linux_${TARGETARCH}.tar.gz" \
 && mv k9s /usr/local/bin \
 && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
   | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg \
 && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
   | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
 && apt-get update \
 && apt-get -y install \
   google-cloud-cli-gke-gcloud-auth-plugin \
   kubectl \
 && rm -rf /tmp/*
