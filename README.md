# Umajin Dev Containers

A collection of reusable Dev Container images and Features for development environments.

The goal is to provide small, composable development environments that can be extended with optional language and tooling Features.

## Repository Structure

```
.
├── images/
│   └── minimal/
│       ├── Dockerfile
│       ├── Taskfile.yml
│       └── README.md
│
├── src/
│   ├── node/
│   ├── php/
│   ├── go/
│   └── ...
│
└── .github/
    └── workflows/
```

## Images

Images provide the base development environment.

### Minimal

The minimal image provides a lightweight developer shell with common tools installed:

- Bash
- Git
- Task
- Starship
- Common CLI utilities

See [`images/minimal`](./images/minimal) for details.

## Features

Features extend the base image with additional development tooling.

Examples:

- Node.js
- PHP
- Go
- Python
- Kubernetes tooling
- Cloud tooling

Features can be added independently depending on the requirements of the project.

Example:

```json
{
    "image": "ghcr.io/umajin/devcontainers:latest",
    "features": {
        "ghcr.io/umajin/devcontainers/node:1": {},
        "ghcr.io/umajin/devcontainers/php:1": {}
    }
}
```

## Usage

Add the image or features to your `devcontainer.json`.

Example:

```json
{
    "name": "My Development Environment",
    "image": "ghcr.io/umajin/devcontainers:latest",
    "features": {
        "ghcr.io/umajin/devcontainers/node:1": {}
    }
}
```

## Development

### Building an image locally

Images contain their own build tasks.

Example:

```bash
cd images/minimal
task build
```

### Adding a Feature

Create a new Feature under `src`:

```
src/
└── my-feature/
    ├── devcontainer-feature.json
    └── install.sh
```

Features should be:

- Independent
- Versioned
- Optional
- Composable with other Features

## Publishing

Images and Features are published to GitHub Container Registry.

Releases are automated through GitHub Actions.

Published artifacts:

```
ghcr.io/umajin/devcontainers
ghcr.io/umajin/devcontainers/<feature>
```

## Design Goals

- Keep the base image small
- Prefer composable Features over large images
- Avoid unnecessary tooling in every environment
- Provide reproducible development environments
- Make adding new tooling simple