# Credit to https://github.com/sdushantha/tmpmail

FROM alpine:3.16.0

RUN apk --no-cache add curl jq w3m xclip util-linux

RUN curl -L "https://raw.githubusercontent.com/sdushantha/tmpmail/master/tmpmail" > tmpmail && chmod +x tmpmail

RUN mv tmpmail /bin/

COPY new /bin/new

RUN chmod +x /bin/new
