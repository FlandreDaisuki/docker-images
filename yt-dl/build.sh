#!/bin/bash

SELF_DIRNAME=$(dirname "$0")

cd "$SELF_DIRNAME" || exit

git clone --depth=1 https://github.com/mikenye/docker-youtube-dl.git
cd 'docker-youtube-dl' || exit

docker build . -t flandre/yt-dl:latest

cd ..
rm -rf 'docker-youtube-dl'
