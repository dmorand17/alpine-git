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

## Publishing to Docker Hub

To publish this container to Docker Hub, follow these steps:

1. Create a Docker Hub account if you don't have one at [hub.docker.com](https://hub.docker.com)

2. Login to Docker Hub from your terminal:

```bash
docker login
```

3. Tag your image with your Docker Hub username and repository name:

```bash
docker tag alpine-git:latest yourusername/alpine-git:latest
```

4. Push the image to Docker Hub:

```bash
docker push yourusername/alpine-git:latest
```

5. For multi-platform images, you can build and push directly using:

```bash
docker buildx build --platform linux/arm64,linux/amd64 \
    -t yourusername/alpine-git:latest \
    --push .
```

After publishing, others can pull and use your image with:

```bash
docker pull yourusername/alpine-git:latest
```
