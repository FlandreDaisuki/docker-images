# Docker Images

My utility docker images

## bat

```shell
make bat

alias bat='docker run --rm -i -v="$PWD:/workdir" flandre/bat bat'
```

## yt-dl

```shell
make yt-dl

# ref: https://github.com/mikenye/docker-youtube-dl#quick-start
alias yt-dl='docker run \
                --rm -i \
                -e PGID=$(id -g) \
                -e PUID=$(id -u) \
                -v "$(pwd)":/workdir:rw \
                flandre/yt-dl'
```

## localtunnel (ngrok alternative)

```shell
alias ngrok='docker-compose -f localtunnel/docker-compose.yml up'
```

## tmpmail

```shell
alias tmpmail-sh='docker run --rm -it flandre/tmpmail sh'
```

### Usage

```shell
$ tmpmail-sh

# in container...

$ new
kudo.akira207@1secmail.net

$ tmpmail
[ Inbox for kudo.akira207@1secmail.net ]

No new mail
```
