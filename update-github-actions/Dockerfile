# syntax=docker/dockerfile:1

ARG ALPINE_VERSION="3.24.1"

FROM alpine:${ALPINE_VERSION}

RUN apk add --no-cache \
  bash \
  coreutils \
  diffutils \
  github-cli \
  jq \
  perl

COPY --chmod=755 update-github-actions /usr/local/bin/
COPY --chmod=755 update-github-actions.pl /usr/local/bin/

WORKDIR /app

CMD [ "/usr/local/bin/update-github-actions" ]
