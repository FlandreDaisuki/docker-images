# syntax=docker/dockerfile:1

ARG ALPINE_VERSION="3.23.0"

FROM alpine:${ALPINE_VERSION}

RUN apk add --no-cache \
  imagemagick \
  libqrencode-tools \
  zbar

WORKDIR /app

CMD [ "/bin/sh" ]
