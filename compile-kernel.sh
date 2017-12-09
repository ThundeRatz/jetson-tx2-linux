#!/bin/bash
set -xe
docker build -t jetson-tx2-linux docker/
docker run --rm -v "$(readlink -f "$(dirname "$0")")":/jetson-tx2-linux jetson-tx2-linux
