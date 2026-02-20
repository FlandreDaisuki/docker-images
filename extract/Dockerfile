# syntax=docker/dockerfile:1

FROM ubuntu:24.04

RUN apt-get update \
 && apt-get -y --no-install-recommends install \
   ca-certificates \
   curl \
   locales \
   p7zip-full \
   unrar \
   unzip \
   xz-utils \
   zstd \
 && curl https://raw.githubusercontent.com/xvoland/Extract/master/extract.sh -o /usr/bin/extract \
 && echo extract \"\$@\" >> /usr/bin/extract  \
 && chmod +x /usr/bin/extract \
 && mkdir -p /app

ENV LANG=C.utf8

WORKDIR /app

CMD [ "/usr/bin/extract" ]
