FROM ubuntu:22.04

RUN apt-get update \
 && apt-get -y --no-install-recommends install \
   curl \
   zstd \
   p7zip \
   unrar \
   locales \
   xz-utils \
   ca-certificates \
 && curl https://raw.githubusercontent.com/xvoland/Extract/master/extract.sh -o /usr/bin/extract \
 && echo extract \"\$@\" >> /usr/bin/extract  \
 && chmod +x /usr/bin/extract \
 && mkdir -p /app

ENV LANG=C.utf8

WORKDIR /app

CMD [ "/usr/bin/extract" ]
