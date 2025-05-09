#!/bin/bash

set -euo pipefail

# Check if image is already pulled, if not pull it from docker hub
if ! docker images alpine-git | grep -q alpine-git; then
    docker pull ${GIT_CONTAINER_IMAGE:-docker.io/dmorand17/alpine-git:latest}
fi

# Run git inside container
docker run --rm -it \
    -v $HOME/.ssh/id_ecdsa_github:/home/git-user/.ssh/id_rsa \
    -v $PWD:/git \
    alpine-git "$@"
