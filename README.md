# Docker Images

My utility docker images

- [extract](#extract)

## extract

```sh
alias extract='docker run --rm -it \
  -u "$(id -u):$(id -g)" \
  -v "$(pwd):/app" \
  ghcr.io/flandredaisuki/docker-images/extract \
  extract'
```
