#!/bin/bash

set -e

echo "Testing PHP installation..."

php --version

if ! command -v php >/dev/null 2>&1; then
    echo "ERROR: php not found"
    exit 1
fi

echo "Testing Composer installation..."

composer --version

if ! command -v composer >/dev/null 2>&1; then
    echo "ERROR: composer not found"
    exit 1
fi

echo "Testing PHP extensions..."

php -m | grep -q mbstring || {
    echo "ERROR: mbstring extension missing"
    exit 1
}

php -m | grep -q xml || {
    echo "ERROR: xml extension missing"
    exit 1
}

php -m | grep -q curl || {
    echo "ERROR: curl extension missing"
    exit 1
}

echo "All tests passed."