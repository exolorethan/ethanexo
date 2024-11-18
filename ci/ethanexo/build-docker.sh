#!/usr/bin/env bash

export LC_ALL=C

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"/../.. || exit

DOCKER_IMAGE=${DOCKER_IMAGE:-ethanexopay/ethanexod-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}
DOCKER_RELATIVE_PATH=contrib/containers/deploy

BUILD_DIR=${BUILD_DIR:-.}


if [ -d $DOCKER_RELATIVE_PATH/bin ]; then
    rm $DOCKER_RELATIVE_PATH/bin/*
fi

mkdir $DOCKER_RELATIVE_PATH/bin
cp "$BUILD_DIR"/src/ethanexod    $DOCKER_RELATIVE_PATH/bin/
cp "$BUILD_DIR"/src/ethanexo-cli $DOCKER_RELATIVE_PATH/bin/
cp "$BUILD_DIR"/src/ethanexo-tx  $DOCKER_RELATIVE_PATH/bin/
strip $DOCKER_RELATIVE_PATH/bin/ethanexod
strip $DOCKER_RELATIVE_PATH/bin/ethanexo-cli
strip $DOCKER_RELATIVE_PATH/bin/ethanexo-tx

docker build --pull -t "$DOCKER_IMAGE":"$DOCKER_TAG" -f $DOCKER_RELATIVE_PATH/Dockerfile docker
