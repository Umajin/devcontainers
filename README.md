# Minimal Debian Dev Container Image

A small, Debian-based development container image designed as a lightweight foundation for VS Code Dev Containers.

The goal is to provide the essential developer experience without the overhead of a full-featured base image.
It's much smaller than the official base image from microsoft.

## Features

Based on:

- Debian Trixie Slim

Included tools:

- Bash
- Git
- Curl
- CA certificates
- Unzip
- jq
- ripgrep
- fzf (ctrl+r finder)
- procps utilities (ping etc)
- Taskfile.dev
- Starship prompt

## Design Goals

This image aims to be:

- Small
- Fast to build
- Easy to extend
- Suitable as a reusable base image for multiple projects

It intentionally does not include:

- Programming language runtimes
- Framework-specific tooling
- Docker-in-Docker
- Kubernetes tooling
- Build systems
- Application services

Add only what each project requires.

## Using with VS Code Dev Containers

Example `.devcontainer/devcontainer.json`:

```json
{
  "name": "Development Container",
  "image": "ghcr.io/umajin/devcontainer:latest",

  // Add whatever features you require (e.g. node & python)
  // See: https://containers.dev/features
  "ghcr.io/devcontainers/features/node:2": {},
  "ghcr.io/devcontainers/features/python:1": {},
}
```

## Building the image

If you change this image and need to release a new version, follow the steps below.

1. Create a github personal access token. Specifically a classic token 
     with: `package:read, package:delete` permissions.
2. Create a .env file containing the following params

```
GITHUB_OWNER=umajin
IMAGE_NAME=devcontainer
GITHUB_USER={yourusername}
GITHUB_TOKEN={your-github-pat}
```

Then run 

```
task build`
```

3. Test the image


```
docker run -ti --rm ghcr.io/umajin/devcontainer
```

This will start the container with a new shell and allow you to look around and check if your changes worked correctly.

4. Release the new image

```
task release
```