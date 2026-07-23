#!/usr/bin/env bash

set -euo pipefail

PHP_VERSION="${PHP_VERSION:-8.5}"

echo "Installing PHP ${PHP_VERSION}"

apt-get update

if ! apt-cache show "php${PHP_VERSION}-cli" >/dev/null 2>&1; then
    echo "PHP ${PHP_VERSION} is not available in this image"
    exit 1
fi

apt-get install -y --no-install-recommends \
    "php${PHP_VERSION}-cli" \
    "php${PHP_VERSION}-mbstring" \
    "php${PHP_VERSION}-xml" \
    "php${PHP_VERSION}-curl" \
    unzip \
    curl

rm -rf /var/lib/apt/lists/*

echo "Installing Composer"

curl -fsSL https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin \
    --filename=composer

php --version
composer --version