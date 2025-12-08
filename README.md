# Docker Images

My utility docker images

- [extract](#extract)
- [gcloud-k9s](#gcloud-k9s)
- [qrcode](#qrcode)

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

## qrcode

```sh
qrcode-encode() {
  if [ -z "$1" ]; then
    echo "Usage: qrcode-encode <text> [qrencode_options...]" >&2
    echo "Example: qrcode-encode 'hello-world'" >&2
    return 1
  fi

  local text_to_encode="${1}"
  local qrencode_options=("${@:2}")

  if ! grep -q -- '-o' <<< "${qrencode_options[*]}"; then
    qrencode_options+=("-o" "qrcode-$(date +%Y%m%d%H%M%S).png")
  fi

  docker run --rm -it \
    --user "$(id -u):$(id -g)" \
    -v "$(pwd):/app" \
    ghcr.io/flandredaisuki/docker-images/qrcode \
    qrencode "${qrencode_options[@]}" "${text_to_encode}"
}

qrcode-decode() {
  if [ -z "$1" ]; then
    echo "Usage: qrcode-decode <PATH_TO_QR_IMAGE_FILE>" >&2
    echo "Example: qrcode-decode code.png" >&2
    return 1
  fi

  local image_file="${1}"

  if [ ! -f "${image_file}" ]; then
    echo "Error: Image file **${image_file}** not found." >&2
    return 1
  fi

  docker run --rm -it \
    --user "$(id -u):$(id -g)" \
    -v "$(dirname "${image_file}"):/app" \
    ghcr.io/flandredaisuki/docker-images/qrcode \
    zbarimg -q1 --raw --nodbus "/app/$(basename "${image_file}")"
}
```
