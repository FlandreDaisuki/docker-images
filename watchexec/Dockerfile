# syntax=docker/dockerfile:1

ARG ALPINE_VERSION="3.23.0"

FROM alpine:${ALPINE_VERSION}

RUN apk add --no-cache \
  watchexec \
  curl

WORKDIR /app

CMD [ "/usr/bin/watchexec" ]
