# Volta Dev Container Feature

Installs [Volta](https://volta.sh), a JavaScript toolchain manager for Node.js projects.

This feature only installs Volta. It does not install Node.js, npm, pnpm, yarn, or any project-specific tooling.

Project tooling is defined by the project's `package.json`.

## Usage

Add the feature to your `devcontainer.json`:

```json
{
  "features": {
    "ghcr.io/umajin/devcontainer/volta:1": {}
  },
  "postCreateCommand": "volta install"
}