# syntax=docker/dockerfile:1

ARG DEBIAN_VERSION="bookworm-slim"

FROM debian:${DEBIAN_VERSION}

ARG BW_CLI_VERSION="2026.6.0"

ARG TARGETARCH

RUN groupadd -g 1000 user \
 && useradd -m -u 1000 -g user -s /bin/bash user \
 && mkdir -p /backups \
 && chown user:user /backups \
 && apt-get update && apt-get install -y \
      curl \
      unzip \
      jq \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/* \
 && if [ "$TARGETARCH" = "arm64" ]; then \
      FILENAME="bw-linux-arm64-${BW_CLI_VERSION}.zip"; \
    else \
      FILENAME="bw-linux-${BW_CLI_VERSION}.zip"; \
    fi \
 && curl -LO "https://github.com/bitwarden/clients/releases/download/cli-v${BW_CLI_VERSION}/${FILENAME}" \
 && unzip "${FILENAME}" -d /usr/local/bin/ \
 && chmod +x /usr/local/bin/bw \
 && rm "${FILENAME}"

WORKDIR /backups

USER user

CMD ["bw"]
