# Minimal Debian Dev Container Image

A small, Debian-based development container image designed as a lightweight foundation for VS Code Dev Containers.

The goal is to provide the essential developer experience without the overhead of a full-featured base image.
It's much smaller than the official one from MS.

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
- fzf
- procps utilities
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
  "overrideCommand": true
}