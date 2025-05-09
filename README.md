# Git Container

A lightweight Docker container that provides a secure, isolated environment for running Git commands. Built on Alpine Linux, this container ensures consistent Git operations across different environments while maintaining security through proper isolation and SSH key management.

## Installation

1. Create the installation link:

```bash
ln -fs script.sh ~/.local/bin/git-c
```

2. (Optional) Configure the container image:

```bash
# Set the default container image (defaults to 'alpine-git:latest')
export GIT_CONTAINER_IMAGE="yourusername/alpine-git:latest"

# Add to your shell configuration file for persistence
echo 'export GIT_CONTAINER_IMAGE="yourusername/alpine-git:latest"' >> ~/.bashrc  # or ~/.zshrc
```

The `GIT_CONTAINER_IMAGE` environment variable allows you to:

- Use a custom image name/tag
- Switch between different versions of the container
- Use a published image from Docker Hub
- Use a locally built image

## Usage

This container provides a secure and isolated environment for running git commands. It's particularly useful when you want to:

- Run git commands in a consistent environment
- Avoid installing git on your host system
- Work with git in CI/CD pipelines
- Ensure git operations are isolated from your host system

### Quick Start

Using installation link (recommended for local development):

```bash
git-c [git commands]
```

For example:

```bash
git-c status
git-c commit -m "feat: add new feature"
git-c push origin main
```

### Manual Container Usage

Running container manually with SSH key and volume mounting:

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
