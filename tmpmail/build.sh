#!/bin/bash

SELF_DIRNAME=$(dirname "$0")

cd "$SELF_DIRNAME" || exit

docker build . -t flandre/tmpmail:latest
