FROM alpine:3.15.1

LABEL maintainer="FlandreDaisuki"

RUN mkdir -p /workdir && \
  apk update && \
  apk add --no-cache bat

WORKDIR /workdir

CMD [ "bat" ]
