# Docker Images

My utility docker images

- [extract](#extract)
- [gcloud-k9s](#gcloud-k9s)

## extract

```sh
alias extract='docker run --rm -it \
  -u "$(id -u):$(id -g)" \
  -v "$(pwd):/app" \
  ghcr.io/flandredaisuki/docker-images/extract \
  extract'
```

## gcloud-k9s

follow [official gcloud-cli with docker instruction](https://cloud.google.com/sdk/docs/downloads-docker#installing_a_specified_docker_image) first, then:

```sh
alias k9s='docker run --rm -it \
  -v "$HOME/.ssh:/root/.ssh" \
  -v "$HOME/.config/gcloud:/root/.config/gcloud" \
  -v "$HOME/.kube:/root/.kube" \
  -v "$PWD:/$(basename $PWD)" \
  -w "/$(basename $PWD)" \
  --volumes-from gcloud-config \
  ghcr.io/flandredaisuki/docker-images/gcloud-k9s k9s'
```
