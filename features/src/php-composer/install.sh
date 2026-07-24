#!/usr/bin/env bash

set -euo pipefail

PHPVERSION="${PHPVERSION:-8.5}"

echo "Installing PHP ${PHPVERSION}"

apt-get update

apt-get install -y --no-install-recommends \
    lsb-release \
    ca-certificates \
    curl

mkdir -p /etc/apt/keyrings

curl -sSL https://packages.sury.org/php/apt.gpg \
    -o /etc/apt/keyrings/sury-php.gpg

echo "deb [signed-by=/etc/apt/keyrings/sury-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" \
    > /etc/apt/sources.list.d/sury-php.list

apt-get update

if ! apt-cache show "php${PHPVERSION}-cli" >/dev/null 2>&1; then
    echo "PHP ${PHPVERSION} is not available"
    exit 1
fi

apt-get install -y --no-install-recommends \
    "php${PHPVERSION}-cli" \
    "php${PHPVERSION}-mbstring" \
    "php${PHPVERSION}-xml" \
    "php${PHPVERSION}-curl" \
    unzip

curl -fsSL https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin \
    --filename=composer

rm -rf /var/lib/apt/lists/*

php --version
composer --version