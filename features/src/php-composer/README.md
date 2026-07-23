# PHP Composer Dev Container Feature

A Dev Container Feature that installs PHP CLI and Composer globally.

This feature installs:

- PHP CLI
- Common PHP extensions required by Composer packages
- Composer (latest version)

## Features

- Configurable PHP version
- Installs Composer globally
- Installs common PHP extensions
- Cleans up apt package lists after installation

## Options

### `phpVersion`

The PHP version to install.

Default:

```json
{
  "phpVersion": "8.5"
}
```

Example:

```json
{
  "features": {
    "ghcr.io/umajin/devcontainers/features/php-composer:1": {
      "phpVersion": "8.4"
    }
  }
}
```

## Installed Packages

The feature installs:

- php<version>-cli
- php<version>-mbstring
- php<version>-xml
- php<version>-curl

For example, with php 8.5:

- php8.5-cli
- php8.5-mbstring
- php8.5-xml
- php8.5-curl


