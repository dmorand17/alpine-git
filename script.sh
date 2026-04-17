#!/bin/bash

set -euo pipefail

GIT_IMAGE="${GIT_CONTAINER_IMAGE:-dmorand17/alpine-git:latest}"

# Check if image is already pulled, if not pull it from docker hub
if ! docker images "$GIT_IMAGE" | grep -q "${GIT_IMAGE%%:*}"; then
    docker pull "$GIT_IMAGE"
fi

# Run git inside container
docker run --rm -i \
    -v $HOME/.ssh/id_ed25519:/home/git-user/.ssh/id_rsa \
    -v $PWD:/git \
    "$GIT_IMAGE" "$@"
