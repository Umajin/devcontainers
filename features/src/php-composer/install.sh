#!/usr/bin/env bash

set -euo pipefail

PHPVERSION="${PHPVERSION:-8.5}"

echo "Installing PHP ${PHPVERSION}"

apt-get update
sudo apt install -y lsb-release ca-certificates curl
sudo mkdir -p /etc/apt/keyrings
curl -sSL https://packages.sury.org/php/apt.gpg -o /etc/apt/keyrings/sury-php.gpg
echo "deb [signed-by=/etc/apt/keyrings/sury-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/sury-php.list
sudo apt update

if ! apt-cache show "php${PHP_VERSION}-cli" >/dev/null 2>&1; then
    echo "PHP ${PHP_VERSION} is not available in this image"
    exit 1
fi

apt-get install -y --no-install-recommends \
    "php${PHPVERSION}-cli" \
    "php${PHPVERSION}-mbstring" \
    "php${PHPVERSION}-xml" \
    "php${PHPVERSION}-curl" \
    unzip \
    curl

rm -rf /var/lib/apt/lists/*

echo "Installing Composer"

curl -fsSL https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin \
    --filename=composer

php --version
composer --version