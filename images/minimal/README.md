# Minimal Debian Dev Container Image

A small, Debian-based development container image designed as a lightweight foundation for VS Code Dev Containers.

The goal is to provide the essential developer experience without the overhead of a full-featured development image.

It is significantly smaller than the official Microsoft Dev Container base images and is designed to be extended through Dev Container Features.

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
- fzf (Ctrl+R history finder)
- procps utilities (ps, top, ping, etc.)
- Taskfile.dev
- Starship prompt

## Design Goals

This image aims to be:

- Small
- Fast to build
- Easy to extend
- Suitable as a reusable foundation for multiple projects

It intentionally does not include:

- Programming language runtimes
- Framework-specific tooling
- Docker-in-Docker
- Kubernetes tooling
- Build systems
- Application services

Add only what each project requires through Dev Container Features.

## Using with VS Code Dev Containers

Example `.devcontainer/devcontainer.json`:

```json
{
  "name": "Development Container",
  "image": "ghcr.io/umajin/devcontainer:latest",

  "features": {
    "ghcr.io/devcontainers/features/node:2": {},
    "ghcr.io/devcontainers/features/python:1": {}
  }
}