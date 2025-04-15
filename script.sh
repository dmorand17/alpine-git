#!/bin/bash

set -e

# Check if alpine-git image exists
if ! docker images alpine-git | grep -q alpine-git; then
    echo "alpine-git image does not exist, building it..."
    # Change to script directory relative to this file even if its a symlink
    pushd "$(dirname "$(readlink -f "$0")")" &> /dev/null
    docker build -t alpine-git .
    popd &> /dev/null
fi

# Run git inside container
docker run --rm -it \
    -v $HOME/.ssh/id_ecdsa_github:/home/git-user/.ssh/id_rsa \
    -v $PWD:/git \
    alpine-git "$@"
