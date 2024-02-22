# Git Container

Run git inside a container

## Installation

```bash
ln -fs script.sh ~/.local/bin/git-c
```

## Usage

Using installation link

```bash
git-c [git commands]
```

Running container manually

```bash
docker run --rm -it \
    -v $HOME/.ssh/id_ecdsa_github:/home/git-user/.ssh/id_rsa \
    -v $PWD:/git \
    alpine-git [-- <optional command>]
```

## Build

Build the image with the following command

```bash
# Standard build
docker build -t alpine-git:latest .

# Multi-platform build
docker build --platform linux/arm64,linux/amd64 -t git-container:latest .

# Get list of images
docker image ls -a
```
