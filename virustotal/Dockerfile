# syntax=docker/dockerfile:1

ARG DEBIAN_VERSION="13.2-slim"

FROM debian:${DEBIAN_VERSION}

ENV VT_CLI_VERSION="1.2.0"

RUN groupadd -g 1000 user \
 && useradd -m -u 1000 -g user -s /bin/bash user \
 && mkdir -p /app \
 && chown user:user /app \
 && apt-get update \
 && apt-get -y --no-install-recommends install \
      ca-certificates \
      curl \
      jq \
      unzip \
 && curl -fsSL https://github.com/VirusTotal/vt-cli/releases/download/${VT_CLI_VERSION}/Linux64.zip \
      -o /tmp/Linux64.zip \
 && unzip /tmp/Linux64.zip -d /usr/local/bin \
 && chmod +x /usr/local/bin/vt \
 && rm -rf /tmp/Linux64.zip

COPY --chmod=755 vt-scan /usr/local/bin

WORKDIR /app

USER user

CMD [ "/usr/local/bin/vt" ]
