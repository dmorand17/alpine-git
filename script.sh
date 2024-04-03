#!/bin/bash

set -e

# Run git inside container
docker run --rm -it \
    -v $HOME/.ssh/id_ecdsa_github:/home/git-user/.ssh/id_rsa \
    -v $PWD:/git \
    alpine-git "$@"
