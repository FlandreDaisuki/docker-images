# Docker Images

My utility docker images

## bat

```shell
make bat

alias bat='docker run --rm -i -v="$PWD:/workdir" flandre/bat bat'
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
