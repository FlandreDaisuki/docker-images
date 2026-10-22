# Based on https://github.com/frosty5689/docker-hath.
FROM eclipse-temurin:8-jre-alpine

LABEL maintainer="FlandreDaisuki <github@flandre.tw>"

ARG HATH_VERSION=1.6.5

RUN apk add --no-cache ca-certificates tzdata libgcc \
 && update-ca-certificates \
 && apk add --no-cache --virtual .hath-build-deps wget unzip \
 && wget -O /tmp/hath.zip "https://repo.e-hentai.org/hath/HentaiAtHome_${HATH_VERSION}.zip" \
 && mkdir -p /opt/hath /hath \
 && unzip /tmp/hath.zip -d /opt/hath \
 && rm /tmp/hath.zip \
 && apk del .hath-build-deps

COPY --chmod=755 run/start.sh /opt/hath/start.sh

VOLUME ["/hath/cache", "/hath/data", "/hath/download", "/hath/log", "/hath/tmp"]

CMD ["/opt/hath/start.sh"]
